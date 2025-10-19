from django.db import models
from django.contrib.auth.models import User

class Product(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=12, decimal_places=2)
    slug = models.CharField(max_length=255)
    short_description = models.TextField(null=True, blank=True)
    description = models.TextField(null=True, blank=True)
    dimensions = models.CharField(max_length=255, null=True, blank=True)   # Thêm
    material = models.CharField(max_length=255, null=True, blank=True)     # Thêm
    warranty = models.CharField(max_length=100, null=True, blank=True)     # Thêm
    features = models.TextField(null=True, blank=True)
    is_active = models.BooleanField(default=True)

    @property
    def features_list(self):
        return self.features.split(";") if self.features else []

    class Meta:
        db_table = 'products'
        managed = False

    def __str__(self):
        return self.name


class ProductImage(models.Model):
    id = models.BigAutoField(primary_key=True)
    product = models.ForeignKey(
        Product,
        db_column='product_id',
        on_delete=models.CASCADE,   # nếu xóa Product thì xóa ảnh luôn
        related_name='images'
    )
    url = models.CharField(max_length=1024)
    alt = models.CharField(max_length=255, null=True, blank=True)
    position = models.IntegerField(default=0)
    is_thumbnail = models.BooleanField(default=False)

    class Meta:
        db_table = 'product_images'
        managed = False
        ordering = ['position', 'id']

    def __str__(self):
        return f"Image for {self.product.name}"


class Address(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(
        User,
        db_column='user_id',
        on_delete=models.SET_NULL,
        null=True,
        blank=True
    )
    name = models.CharField(max_length=255, null=True, blank=True)
    phone = models.CharField(max_length=30, null=True, blank=True)
    address_line = models.CharField(max_length=255, null=True, blank=True)
    city = models.CharField(max_length=120, null=True, blank=True)
    district = models.CharField(max_length=120, null=True, blank=True)
    postal_code = models.CharField(max_length=30, null=True, blank=True)
    country = models.CharField(max_length=120, default='Vietnam')

    class Meta:
        db_table = 'addresses'
        managed = False

    def __str__(self):
        return f"{self.name} - {self.city}"


class Order(models.Model):
    STATUS_CHOICES = (
        ('pending', 'Pending'),
        ('paid', 'Paid'),
        ('shipped', 'Shipped'),
        ('completed', 'Completed'),
        ('cancelled', 'Cancelled'),
    )
    PAYMENT_CHOICES = (
        ('unpaid', 'Unpaid'),
        ('pending', 'Pending'),
        ('succeeded', 'Succeeded'),
        ('failed', 'Failed'),
        ('refunded', 'Refunded'),
    )

    id = models.BigAutoField(primary_key=True)
    order_number = models.CharField(max_length=30, unique=True)
    user = models.ForeignKey(
        User,
        db_column='user_id',
        on_delete=models.SET_NULL,
        null=True,
        blank=True
    )
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending')
    subtotal = models.DecimalField(max_digits=12, decimal_places=2)
    shipping_fee = models.DecimalField(max_digits=12, decimal_places=2, default=0)
    discount = models.DecimalField(max_digits=12, decimal_places=2, default=0)
    total = models.DecimalField(max_digits=12, decimal_places=2)
    payment_status = models.CharField(max_length=20, choices=PAYMENT_CHOICES, default='unpaid')
    note = models.TextField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'orders'
        managed = False

    def __str__(self):
        return f"Order {self.order_number} - {self.status}"


class OrderItem(models.Model):
    id = models.BigAutoField(primary_key=True)
    order = models.ForeignKey(
        Order,
        db_column='order_id',
        on_delete=models.CASCADE,
        related_name='items'
    )
    product = models.ForeignKey(
        Product,
        db_column='product_id',
        on_delete=models.SET_NULL,
        null=True,
        blank=True
    )
    variant_id = models.BigIntegerField(null=True, blank=True)
    sku = models.CharField(max_length=100, null=True, blank=True)
    product_name = models.CharField(max_length=255)
    unit_price = models.DecimalField(max_digits=12, decimal_places=2)
    quantity = models.IntegerField()
    line_total = models.DecimalField(max_digits=12, decimal_places=2)

    class Meta:
        db_table = 'order_items'
        managed = False
        ordering = ['id']

    def __str__(self):
        return f"{self.product_name} x {self.quantity}"
