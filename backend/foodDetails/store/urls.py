#important imports
from django.urls import path, include
from .views import userCreate, ProductViewSet, CartViewSet,  ProductRetrieveUpdateDestroy 
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from rest_framework.routers import DefaultRouter
from . import views
from rest_framework_nested import routers

#basename helps to generate view which is order-list and order-details
router = DefaultRouter()
router.register('products',views.ProductViewSet, basename='product')
router.register('carts',views.CartViewSet, basename='create_cart')
#creating a nested route
carts_router =routers.NestedDefaultRouter(router,'carts',lookup='carts')
carts_router.register('items', views.CartItemViewSet, basename='items')
#passing router and cart urls in url patterns
urlpatterns = router.urls+carts_router.urls












