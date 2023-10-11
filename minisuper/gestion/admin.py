from django.contrib import admin
from .models import Suppliers, Categories, Products

# Register your models here.
admin.site.register(Suppliers)
admin.site.register(Categories)
admin.site.register(Products)
