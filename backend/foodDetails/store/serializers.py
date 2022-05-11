#important imports
from django.contrib.auth.models import User
from rest_framework import serializers
from .models import Product, Cart, CartItem  
from djoser.serializers import UserSerializer as BaseUserSerializer
from django.db import transaction

#user serializer
class UserSerializer(serializers.ModelSerializer):
   #meta class for User
   class Meta:
      model = User
      fields = ['username', 'password','email','first_name','last_name'] #getting required fields only
      extra_kwargs = {'password' : {'write_only':True}}

   def create(self, validated_data):
      password = validated_data.pop("password")
      user = User(**validated_data)
      user.set_password(password)
      user.save()
      return {
         "username": user.username,
         "email": user.email
      }

class UserBSerializer(BaseUserSerializer):
   class Meta(BaseUserSerializer.Meta):
      model = User
      fields = ['username', 'password','email','first_name','last_name'] #getting required fields only

#serializer to register user
class UserRegister(BaseUserSerializer):
   class Meta(BaseUserSerializer.Meta):
      model = User
      fields = ['username', 'password','email','first_name','last_name'] #getting required fields only

#product serializer to get all fields of Product model
class ProductSerializers(serializers.ModelSerializer):
   #meta class for Product
   class Meta:
      model = Product
      fields = "__all__" #getting all fields

#serializer to get product name and product price of Product model
class SimpleProductSerializer(serializers.ModelSerializer):
   #meta class for Product
   class Meta:
      model = Product
      fields = ['product_name', 'product_price'] #getting required fields only

#cart item serializer
class CartItemSerializers(serializers.ModelSerializer):
   product = SimpleProductSerializer()
   total_price = serializers.SerializerMethodField()

   #function to get total price of a product
   def get_total_price(self, cart_item:CartItem):
      return cart_item.quantity * cart_item.product.product_price

   #meta class for Cart item
   class Meta:
      model = CartItem
      fields = ['id','product','quantity','total_price'] #getting required fields only

#cart serializer
class CartSerializers(serializers.ModelSerializer):
   id = serializers.UUIDField(read_only=True)
   items = CartItemSerializers(many=True, read_only=True)
   totalPrice = serializers.SerializerMethodField()
   #function to get total price all the product in cart
   def get_totalPrice(self, cart):
      return sum([item.quantity * item.product.product_price for item in cart.items.all()])
   class Meta:
      model = Cart
      fields = ['id','items','totalPrice']#getting required fields only

#serializer to add product item to cart
class AddCartItemSerializer(serializers.ModelSerializer):
   product_id = serializers.IntegerField()
   #function for validating product id
   def validate_product_id(slef, value):
      if not Product.objects.filter(pk=value).exists():
         raise serializers.ValidationError('No product with the given product id.')#error when product id does not exist
      return value

   #function to save cart item
   def save(self, **kwargs):
      cart_id = self.context['cart_id']
      product_id = self.validated_data['product_id']
      quantity = self.validated_data['quantity']
      #adding item to cart
      try:
         cart_item = CartItem.objects.get(cart_id=cart_id, product_id=product_id)
         cart_item.quantity += quantity
         cart_item.save()#saving cart item
         self.instance = cart_item
         #updating an existing item
      except CartItem.DoesNotExist:
         #Create a new item
         self.instance = CartItem.objects.create(cart_id=cart_id, **self.validated_data)
      return self.instance
      #meta class for CartItem
   class Meta:
      model = CartItem
      fields = ['id','product_id','quantity'] #getting required fields only

#serializers to update quantity in cart 
class UpdateCartItemSerializer(serializers.ModelSerializer):
   #meta class for Update cart item
   class Meta:
      model = CartItem
      fields = ['quantity'] #getting required fields only

