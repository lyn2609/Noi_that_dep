def cart_count(request):
    """
    Trả về tổng số lượng sản phẩm trong giỏ hàng
    (lưu trong session với key là string).
    """
    cart = request.session.get('cart', {})
    total_qty = sum(cart.values())

    # Debug in terminal
    print(">>> CONTEXT CART:", cart, "| TOTAL:", total_qty)

    return {'cart_count': total_qty}
