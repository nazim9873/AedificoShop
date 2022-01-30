from django.http.response import HttpResponse, JsonResponse
from django.shortcuts import render , redirect , HttpResponseRedirect
from rest_framework import generics
from store.models.product import Products
from store.models.category import Category
from store.models.orders import Order
from store.models.customer import Customer
from django.views import View
from store.serializers import CategorySerializer,ProductSerializer,OrderSerializer,CustomerSerializer
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
import io

def category_detail(request):
    p=Category.objects.all()
    serializer=CategorySerializer(p,many=True)
    json_data=JSONRenderer().render(serializer.data)
    return HttpResponse(json_data,content_type='application/json')

    
def category_create(request):
    if request.method== "POST":
        json_data=request.body
        print(json_data,"json_data")
        stream=io.BytesIO(json_data)
        print("stream",stream)
        python_data=JSONParser().parse(stream)
        print("pythondata",python_data)
        serializer=CategorySerializer(data=python_data)
        if serializer.is_valid():
            serializer.save()
            res={'msg':'Data Created'}
            json_data=JSONRenderer().render(res)
            return HttpResponse(json_data,content_type="application/json")
        json_data=JSONRenderer().render(serializer.errors)
        return HttpResponse(json_data,content_type="application/json")
    
class ProductList(generics.ListCreateAPIView):
    queryset=Products.objects.all()
    serializer_class=ProductSerializer

class ProductDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset=Products.objects.all()
    serializer_class=ProductSerializer

class CustomerList(generics.ListCreateAPIView):
    queryset=Customer.objects.all()
    serializer_class=CustomerSerializer

class CustomerDetail(generics.RetrieveUpdateDestroyAPIView):
     queryset=Customer.objects.all()
     serializer_class=CustomerSerializer

class OrderList(generics.ListCreateAPIView):
    queryset=Order.objects.all()
    serializer_class=OrderSerializer

class OrderDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset=Order.objects.all()
    serializer_class=OrderSerializer