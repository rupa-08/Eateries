from django.db import models
from datetime import datetime
from django.core.validators import MinValueValidator
from uuid import uuid4
from django.contrib.auth.models import User
# from .validators import validate_file_size

# Create your models here.
#Product model
class Product(models.Model):
   VEG_CATEGORY = 'Veg'
   NONVEG_CATEGORY = 'Non_veg'

   CATEGORY_CHOICES = [
       (VEG_CATEGORY, 'Veg'),
       (NONVEG_CATEGORY, 'Non_Veg'),
   ] #options for category
   product_name = models.CharField(max_length=100)
   product_price = models.DecimalField(
       max_digits=6, 
       decimal_places=2,
       validators=[MinValueValidator(1)]
       )
   product_expiry_date = models.DateTimeField(default=datetime.utcnow)
   quantity = models.IntegerField()
   tag = models.CharField(max_length=10)
   description = models.TextField(max_length=700)
   category = models.CharField(max_length=10, choices=CATEGORY_CHOICES, default=VEG_CATEGORY)#setting choice field for product category
   store_name = models.CharField(max_length=70)
   store_address=models.CharField(max_length=50)
   store_phone=models.IntegerField()
   image = models.ImageField(
        upload_to='store/images',
       # validators=[validate_file_size]    
    )#image field to store product image and validating product image size

   class Meta: 
        ordering = ['product_name'] # for ordering

#Cart Model
class Order(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid4)
    created_at = models.DateTimeField(auto_now_add=True) #date and time of cart created at

class OrderItem(models.Model):
    cart = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='items')#foreign key
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveSmallIntegerField(
        validators=[MinValueValidator(1)]#validating cart quantity
    )
    
    paid = 'Paid'
    unpaid = 'Unpaid'

    PAYMENT_CHOICES = [
       (paid, 'Paid'),
       (unpaid, 'Unpaid'),
   ]
    # payment_status = models.ForeignKey(Cart, on_delete=models.CASCADE, related_name='items')
    payment = models.CharField(max_length=10, choices=PAYMENT_CHOICES, default=paid)
    
    class Meta:
        unique_together = [['cart','product']]#unique cart and product

# class Payment(models.Model):
#     paid = 'Paid'
#     unpaid = 'Unpaid'

#     PAYMENT_CHOICES = [
#        (paid, 'Paid'),
#        (unpaid, 'Unpaid'),
#    ]
#     # payment_status = models.ForeignKey(Cart, on_delete=models.CASCADE, related_name='items')
#     payment = models.CharField(max_length=10, choices=PAYMENT_CHOICES, default=unpaid)

