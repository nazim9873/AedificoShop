from django.contrib import admin
from django.urls import path
from .views.home import Index , store
from .views.signup import Signup
from .views.api import category_detail,category_create,ProductDetail,ProductList,OrderDetail,OrderList,CustomerDetail,CustomerList
from .views.login import Login , logout
from .views.cart import Cart
from .views.checkout import CheckOut
from .views.orders import OrderView
from .middlewares.auth import  auth_middleware
from django.views.decorators.csrf import csrf_exempt



urlpatterns = [
    path('', Index.as_view(), name='homepage'),
    path('store', store , name='store'),

    path('signup', Signup.as_view(), name='signup'),
    path('login', Login.as_view(), name='login'),
    path('logout', logout , name='logout'),
    path('cart', auth_middleware(Cart.as_view()) , name='cart'),
    path('check-out', CheckOut.as_view() , name='checkout'),
    path('orders', auth_middleware(OrderView.as_view()), name='orders'),
    path('detail/', category_detail, name='category_detail'),
    path('prolist/', ProductList.as_view()),
    path('prodetail/<int:pk>/', ProductDetail.as_view()),
    path('orderlist/', OrderList.as_view()),
    path('orderdetail/<int:pk>/', OrderDetail.as_view()),
    path('custlist/',CustomerList.as_view()),
    path('custdetail/<int:pk>/', CustomerDetail.as_view()),
    path('create/', csrf_exempt(category_create), name='category_create'),

]
