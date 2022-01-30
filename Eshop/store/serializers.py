from django.db.models.base import Model
from rest_framework import serializers
from store.models.category import Category
from store.models.orders import Order
from store.models.product import Products
from store.models.customer import Customer
class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = "__all__"



class CustomerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Customer
        fields = "__all__"

class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = "__all__"

class ProductSerializer(serializers.ModelSerializer):
   class Meta:
        model = Products
        fields = "__all__"