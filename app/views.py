from decimal import Decimal
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth import login
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from django.db import transaction
from django.db.models import Q
from django.shortcuts import redirect
from django.http import JsonResponse
from django.contrib.auth import logout
from django.utils.formats import number_format
from django.contrib.auth.decorators import login_required
from .models import Product, Order, OrderItem, Address
from .forms import RegisterForm, CheckoutForm
from django.core.paginator import Paginator
from .forms import CustomUserCreationForm
from .forms import LoginForm
from django.contrib.auth import authenticate, login


# --------- Pages ----------
def index(request):
    # lấy 4 sản phẩm nổi bật để show ở trang chủ
    featured_products = Product.objects.filter(is_active=True).order_by('-id')[:4]
    return render(request, 'index.html', {'featured_products': featured_products})


def about(request):
    return render(request, 'about.html')


def contact(request):
    return render(request, 'contact.html')


# --------- Products ----------
def product_list(request):
    category = request.GET.get('category')
    max_price = request.GET.get('max_price')
    sort = request.GET.get('sort')
    search_query = request.GET.get('search', '').strip() 

    products = Product.objects.filter(is_active=True)
    if search_query:
        products = products.filter(name__icontains=search_query)

    # Lọc theo category
    if category:
        products = products.filter(slug__icontains=category)

    # Lọc theo giá
    if max_price:
        try:
            products = products.filter(price__lte=int(max_price))
        except:
            pass

    # Sắp xếp
    if sort == "price_asc":
        products = products.order_by("price")
    elif sort == "price_desc":
        products = products.order_by("-price")
    elif sort == "name_asc":
        products = products.order_by("name")
    elif sort == "name_desc":
        products = products.order_by("-name")

    # Phân trang
    paginator = Paginator(products, 6)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, "products.html", {
        "page_obj": page_obj,
        "category": category,
    })


def product_detail(request, pk):
    product = get_object_or_404(Product, pk=pk, is_active=True)
    return render(request, 'product_detail.html', {'product': product})


# --------- Cart (session) ----------
def _get_cart(request):
    """Lấy giỏ hàng từ session"""
    return request.session.get('cart', {})


def _save_cart(request, cart):
    """Lưu giỏ hàng vào session"""
    request.session['cart'] = cart
    request.session.modified = True


def _cart_totals(request):
    cart = _get_cart(request)
    items, subtotal = [], Decimal('0')
    for pid, qty in cart.items():
        try:
            pid = int(pid); qty = int(qty)
            if qty <= 0: continue
            p = Product.objects.get(pk=pid)
            line = Decimal(p.price) * qty
            items.append({'product': p, 'qty': qty, 'subtotal': line})
            subtotal += line
        except (Product.DoesNotExist, ValueError, TypeError):
            continue
    return items, subtotal


def add_to_cart(request, product_id):
    cart = _get_cart(request)
    pid = str(product_id)

    # Lấy số lượng từ URL param (nếu có)
    qty = request.GET.get('qty')
    try:
        qty = int(qty)
        if qty <= 0:
            qty = 1
    except (TypeError, ValueError):
        qty = 1

    # Cộng dồn số lượng vào giỏ
    cart[pid] = cart.get(pid, 0) + qty
    _save_cart(request, cart)

    return redirect('view_cart')


def view_cart(request):
    items, subtotal = _cart_totals(request)
    return render(request, 'cart/cart.html', {'items': items, 'subtotal': subtotal})


def remove_from_cart(request, product_id):
    cart = _get_cart(request)
    pid = str(product_id)
    if pid in cart:
        cart.pop(pid)
    _save_cart(request, cart)
    return redirect('view_cart')


# đã sửa
def update_cart(request):
    if request.method == 'POST':
        cart = _get_cart(request)
        selected_items = request.POST.getlist('selected_items')  # các sản phẩm được chọn
        checkout_items = {}  # session tạm lưu các sản phẩm được chọn để thanh toán

        # Cập nhật số lượng trong cart (nếu có)
        for k, v in request.POST.items():
            if k.startswith('qty_'):
                pid = k[4:]
                try:
                    qty = int(v)
                    if qty > 0:
                        cart[str(pid)] = qty
                except ValueError:
                    pass

        _save_cart(request, cart)

        # Chỉ tạo danh sách thanh toán riêng, KHÔNG xoá sản phẩm khác
        for pid in selected_items:
            if pid in cart:
                checkout_items[pid] = cart[pid]

        # Lưu danh sách được chọn vào session riêng
        request.session['checkout_items'] = checkout_items
        request.session.modified = True

        # Nếu người dùng bấm "Thanh toán"
        if request.POST.get('go') == 'checkout' and selected_items:
            return redirect('checkout')

    return redirect('view_cart')



def change_qty(request, product_id):
    """
    Tăng hoặc giảm số lượng sản phẩm trong giỏ hàng (backend)
    """
    if request.method == "POST":
        action = request.POST.get("action")  # "increase" hoặc "decrease"
        cart = request.session.get("cart", {})  # Lấy giỏ hàng hiện tại
        pid = str(product_id)
        current_qty = int(cart.get(pid, 0))

        if action == "increase":
            current_qty += 1
        elif action == "decrease":
            current_qty = max(1, current_qty - 1)

        cart[pid] = current_qty
        request.session["cart"] = cart
        request.session.modified = True

        # nếu là AJAX (fetch)
        if request.headers.get('x-requested-with') == 'XMLHttpRequest':
            return JsonResponse({"success": True, "new_qty": current_qty})
        
        return redirect('view_cart')


def remove_selected_from_cart(request):
    if request.method != 'POST':
        return JsonResponse({'success': False, 'error': 'invalid method'}, status=405)

    # nhận danh sách id: hỗ trợ cả product_ids[] và product_ids
    ids = request.POST.getlist('product_ids[]') or request.POST.getlist('product_ids')
    # đảm bảo là string
    ids = [str(i) for i in ids if i is not None]

    cart = request.session.get('cart', {})  # { '1': 2, '5': 1, ... }

    for pid in ids:
        cart.pop(pid, None)

    # lưu lại vào session
    request.session['cart'] = cart
    request.session.modified = True

    # trả về số lượng & trạng thái rỗng để client tùy ý dùng
    total_count = sum(cart.values()) if cart else 0
    return JsonResponse({
        'success': True,
        'cart_empty': (len(cart) == 0),
        'count': total_count,
    })

# đã sửa thêm

def clear_buy_now(request):
    """Xóa session mua ngay khi user vào giỏ hàng"""
    if request.method == 'POST':
        if 'buy_now_item' in request.session:
            del request.session['buy_now_item']
            request.session.modified = True
        return JsonResponse({'success': True})
    return JsonResponse({'success': False}, status=400)

# --------- Auth ----------


def custom_logout(request):
    logout(request)  # xóa session đăng nhập
    request.session.flush() # Xoá toàn bộ session (cart, buy_now, v.v.)
    return redirect('home')  # chuyển về trang đăng nhập


def register(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')
    else:
        form = CustomUserCreationForm()
    return render(request, 'auth/register.html', {'form': form})

def login_view(request):
    if request.method == "POST":
        form = LoginForm(request.POST)
        if form.is_valid():
            user = authenticate(
                username=form.cleaned_data['username'],
                password=form.cleaned_data['password']
            )
            if user is not None:
                login(request, user)
                # Ghi nhớ đăng nhập
                if request.POST.get("remember_me"):
                    request.session.set_expiry(60 * 60 * 24 * 7)  # 7 ngày
                else:
                    request.session.set_expiry(0)  # Hết khi đóng trình duyệt
                return redirect("index")
    else:
        form = LoginForm()

    return render(request, "auth/login.html", {"form": form})


# --------- Checkout ----------
def _gen_order_number():
    return timezone.now().strftime('DH%Y%m%d%H%M%S')

def buy_now(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    qty = request.GET.get('qty', '1')

    try:
        qty = int(qty)
        if qty <= 0:
            qty = 1
    except ValueError:
        qty = 1

    request.session['buy_now_item'] = {
        'id': product.id,
        'name': product.name,
        'price': float(product.price),
        'qty': qty,  # Lưu số lượng vào session
    }

    return redirect('checkout')

# đã sửa

@login_required
@transaction.atomic
def checkout(request):
    # XÁC ĐỊNH NGUỒN: kiểm tra xem có phải từ giỏ hàng không
    # Bằng cách kiểm tra referer hoặc session
    referer = request.META.get('HTTP_REFERER', '')
    from_cart = '/cart/' in referer or 'cart' in referer
    
    # Nếu đến từ giỏ hàng, XOÁ session mua ngay
    if from_cart and 'buy_now_item' in request.session:
        del request.session['buy_now_item']
        request.session.modified = True
    
    buy_now_item = request.session.get('buy_now_item')
    
    # Xác định nguồn dữ liệu: MUA NGAY hay GIỎ HÀNG
    if buy_now_item and not from_cart:
        # Nếu là mua ngay
        product = get_object_or_404(Product, id=buy_now_item['id'])
        qty = int(buy_now_item.get('qty', 1))
        items = [{
            'product': product,
            'qty': qty,
            'subtotal': Decimal(product.price) * qty
        }]
        subtotal = Decimal(product.price) * qty
        source = 'buy_now'
    else:
        # Nếu là checkout từ giỏ hàng
        cart = _get_cart(request)
        if not cart:
            messages.warning(request, 'Giỏ hàng trống.')
            return redirect('products')
        
        # Lấy chỉ các sản phẩm đã chọn để thanh toán
        checkout_items = request.session.get('checkout_items', {})
        if not checkout_items:
            messages.warning(request, 'Bạn chưa chọn sản phẩm để thanh toán.')
            return redirect('view_cart')


        items, subtotal = [], Decimal('0')
        for pid, qty in checkout_items.items():
            try:
                product = Product.objects.get(pk=int(pid))
                line = Decimal(product.price) * qty
                items.append({'product': product, 'qty': qty, 'subtotal': line})
                subtotal += line
            except Product.DoesNotExist:
                continue
        source = 'cart'

    # Khi người dùng gửi form thanh toán
    if request.method == 'POST':
        form = CheckoutForm(request.POST)
        if form.is_valid():
            # Lưu địa chỉ giao hàng
            Address.objects.create(
                user=request.user,
                name=form.cleaned_data['name'],
                phone=form.cleaned_data['phone'],
                address_line=form.cleaned_data['address_line'],
                city=form.cleaned_data['city'],
                district=form.cleaned_data['district'],
                postal_code=form.cleaned_data.get('postal_code') or '',
            )

            # Tạo đơn hàng mới
            order = Order.objects.create(
                order_number=_gen_order_number(),
                user=request.user,
                status='pending',
                subtotal=subtotal,
                shipping_fee=0,
                discount=0,
                total=subtotal,
                payment_status='unpaid',
                note=form.cleaned_data.get('note') or '',
            )

            # Lưu các sản phẩm trong đơn hàng
            for row in items:
                p, qty = row['product'], row['qty']
                OrderItem.objects.create(
                    order=order,
                    product=p,
                    product_name=p.name,
                    unit_price=p.price,
                    quantity=qty,
                    line_total=p.price * Decimal(qty)
                )

            # Xóa session sau khi tạo đơn hàng thành công
            if source == 'buy_now' and 'buy_now_item' in request.session:
                del request.session['buy_now_item']
            
            if source == 'cart':
                cart = _get_cart(request)
                checkout_items = request.session.get('checkout_items', {})

                # Xoá các sản phẩm đã thanh toán khỏi giỏ
                for pid in checkout_items.keys():
                    cart.pop(pid, None)

                _save_cart(request, cart)
                request.session.pop('checkout_items', None)


            return redirect('checkout_success', order_number=order.order_number)
    else:
        form = CheckoutForm()

    #  Trả về giao diện checkout
    return render(request, 'checkout/checkout.html', {
        'items': items,
        'subtotal': subtotal,
        'form': form,
        'source': source
    })

@login_required
def checkout_success(request, order_number):
    # Tìm đơn hàng theo mã
    order = Order.objects.filter(order_number=order_number).first()

    if not order:
        messages.error(request, "Không tìm thấy đơn hàng.")
        return redirect('my_orders')

    # Nếu đơn hàng chưa gán user -> gán lại user hiện tại
    if order.user is None and request.user.is_authenticated:
        order.user = request.user
        order.save(update_fields=['user'])

    formatted_total = f"{order.total:,.0f}".replace(",", ".")
    return render(request, "checkout/checkout_success.html", {
        "order": order,
        "formatted_total": formatted_total,
    })


@login_required
def my_orders(request):
    # Lấy tất cả đơn hàng của user đang đăng nhập
    orders = Order.objects.filter(user=request.user).order_by('-created_at')
    return render(request, 'checkout/my_orders.html', {'orders': orders})