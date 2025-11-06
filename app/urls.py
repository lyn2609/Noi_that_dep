# app/urls.py

from django.urls import path
from . import views
from . import auth
from django.contrib.auth import views as auth_views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    # Trang cơ bản
    path('', views.index, name='home'),
    path('index/', views.index, name='index'),   # alias
    path('about/', views.about, name='about'),
    path('contact/', views.contact, name='contact'),

    # Sản phẩm
    path('products/', views.product_list, name='products'),
    path('products/<int:pk>/', views.product_detail, name='product_detail'),
    path('buy-now/<int:product_id>/', views.buy_now, name='buy_now'),

    # Giỏ hàng
    path('cart/', views.view_cart, name='view_cart'),
    path('cart/add/<int:product_id>/', views.add_to_cart, name='add_to_cart'),
    path('cart/remove/<int:product_id>/', views.remove_from_cart, name='remove_from_cart'),
    path('cart/update/', views.update_cart, name='update_cart'),
    path('cart/remove-selected/', views.remove_selected_from_cart, name='remove_selected_from_cart'),
    # đã sửa thêm
    path('clear-buy-now/', views.clear_buy_now, name='clear_buy_now'),

    # Auth
    path('login/', auth.user_login, name='login'),
    path('logout/', auth.user_logout, name='logout'),
    path('register/', auth.user_register, name='register'),
    path('dashboard/', auth.dashboard, name='dashboard'),
    path('', auth.user_login, name='home'),  # Trang chủ
    # Checkout
    path('checkout/', views.checkout, name='checkout'),
    path('checkout/success/<str:order_number>/', views.checkout_success, name='checkout_success'),
    path('my-orders/', views.my_orders, name='my_orders'),
]

# Cho phép truy cập file media (ảnh upload)
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
