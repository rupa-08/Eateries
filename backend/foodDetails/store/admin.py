from django.contrib import admin
from . import models

@admin.register(models.Product)
class ProductAdmin(admin.ModelAdmin):
   # inlines = [TagInline]
   list_display = ['product_name','product_price','category','product_expiry_date','quantity','store_name']
   list_editable = ['product_price']
   list_per_page = 7
   ordering = ['product_name']

   list_filter = ['category','product_expiry_date']
   search_fields = ['product_name__istartswith']


@admin.register(models.CartItem)
class CartItem(admin.ModelAdmin):
   list_display = ['cart','product','quantity']
