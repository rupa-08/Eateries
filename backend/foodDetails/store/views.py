#imports
from django.shortcuts import render
from rest_framework import generics
from rest_framework.response import Response
from rest_framework.decorators import action
from django.contrib.auth.models import User
from rest_framework.permissions import AllowAny, IsAuthenticatedOrReadOnly, IsAdminUser, IsAuthenticated
from .serializers import UserSerializer, ProductSerializers, CartSerializers, CartItemSerializers, SimpleProductSerializer, AddCartItemSerializer, UpdateCartItemSerializer 
from .permissions import IsAdminOrReadOnly, ViewCustomerHistoryPermission
from .models import Product, Cart, CartItem
from rest_framework.mixins import CreateModelMixin, RetrieveModelMixin, UpdateModelMixin,DestroyModelMixin
from rest_framework.viewsets import ModelViewSet, GenericViewSet
from django.contrib.auth.models import User
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter, OrderingFilter

# Create your views here.
class userCreate(generics.CreateAPIView):
   queryset = User.objects.all()#query set to get all objects from User
   serializer_class = UserSerializer
   permission_clalsses = (AllowAny, )#allowing all users to create

class Register(generics.CreateAPIView):
   queryset = User.objects.all() #query set to get all objects from User
   serializer_class = UserSerializer

class ProductViewSet(ModelViewSet):
   queryset = Product.objects.all()#query set to get all objects from User
   serializer_class = ProductSerializers
   permission_classes = [IsAdminOrReadOnly]#allowing only admin
   filter_backends = [DjangoFilterBackend, SearchFilter, OrderingFilter]
   filterset_fields = ['category']#filtering data based on product category
   search_fields = ['product_name','description']#searching product by product name and description
   ordering_fields = ['product_price','product_expiry_date']#ordering by product price and product expiry date

   def get_serializer_context(self):
        return {'request': self.request}

   def destroy(self, request, *args, **kwargs):
        if OrderItem.objects.filter(product_id=kwargs['pk']).count() > 0:
            return Response({'error': 'Product cannot be deleted because it is associated with an order item.'}, status=status.HTTP_405_METHOD_NOT_ALLOWED)

        return super().destroy(request, *args, **kwargs)   

#viewset to read, update and delete product
class ProductRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
   queryset = Product.objects.all()
   serializer_class = ProductSerializers
   permission_classes = (IsAdminOrReadOnly, )#allowing only admin to read

#viewset for cart
class CartViewSet(CreateModelMixin,
                  RetrieveModelMixin,
                  DestroyModelMixin,
                  GenericViewSet):
   queryset = Cart.objects.prefetch_related('items__product').all()#query set to prefetch all cart item
   serializer_class = CartSerializers

class CartItemViewSet(ModelViewSet):
   #allow only four hhtp methods
   http_method_names = ['get','post','patch','delete','options']
   
   #query for post and patch method
   def get_serializer_class(self):
      if self.request.method == 'POST':
         return AddCartItemSerializer #returning AddCartItemSerializer for POST method
      elif self.request.method == 'PATCH':
         return UpdateCartItemSerializer #returning UpdateCartItemSerializer for POST method
      return CartItemSerializers

   def get_serializer_context(self):
        return {'cart_id': self.kwargs['carts_pk']}

   def get_queryset(self):
        return CartItem.objects \
            .filter(cart_id=self.kwargs['carts_pk']) \
            .select_related('product')#query to search based on product

