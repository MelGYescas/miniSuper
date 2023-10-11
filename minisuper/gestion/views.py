from django.shortcuts import render, redirect, get_object_or_404

from django.http import HttpResponse

from django import forms
from .models import Products

# Create your views here.


# View for listing items
def index(request):
    products = Products.objects.all()
    context = {"products": products}
    return render(request, "index.html", context)


# View for creating a new item
def create(request):
    print("*" * 10)
    if request.method == "POST":
        form = ProductForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect(
                "index"
            )  # Redirige al usuario a la página principal (index) después de crear un producto.
    else:
        form = ProductForm()

    context = {"form": form}
    return render(request, "create.html", context)


# View for updating an item (passing the item's ID as a parameter)
def update(request, id):
    product = get_object_or_404(Products, ProductId=id)
    if request.method == "POST":
        form = ProductForm(request.POST, instance=product)
        if form.is_valid():
            form.save()
            return redirect("index")
    else:
        form = ProductForm(instance=product)
    context = {"form": form}
    return render(request, "update.html", context)


# View for deleting an item (passing the item's ID as a parameter)
def delete(request, id):
    product = get_object_or_404(Products, ProductId=id)
    if request.method == "POST":
        product.delete()
        return redirect("index")
    context = {"product": product}
    return render(request, "delete.html", context)


def total_income_over_30_units(request):
    # Consideramos tanto UnitsSoldInStore como UnitsOnOrder
    products_over_30_units_sold = Products.objects.filter(UnitsSoldInStore__gt=30)
    products_over_30_units_order = Products.objects.filter(UnitsOnOrder__gt=30)

    total_income_sold = sum(
        product.UnitPrice * product.UnitsSoldInStore
        for product in products_over_30_units_sold
    )
    total_income_order = sum(
        product.UnitPrice * product.UnitsOnOrder
        for product in products_over_30_units_order
    )

    total_income = total_income_sold + total_income_order

    context = {"total_income": total_income}
    return render(request, "total_income.html", context)


def remaining_units_after_sales(request):
    products = Products.objects.all()
    context = {
        "products": [(product, product.units_after_sales()) for product in products]
    }
    return render(request, "remaining_units.html", context)


def non_perishable_products(request):
    products = Products.objects.filter(CategoryId__Durable=True).order_by("ProductName")

    context = {"products": products}
    return render(request, "non_perishable_products.html", context)


def top_web_sales(request):
    products = Products.objects.order_by(
        "-UnitsOnOrder"
    )  # El signo '-' indica orden descendente

    context = {"products": products}
    return render(request, "top_web_sales.html", context)


class ProductForm(forms.ModelForm):
    class Meta:
        model = Products
        fields = "__all__"
