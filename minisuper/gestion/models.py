from django.db import models


class Suppliers(models.Model):
    SupplierId = models.AutoField(primary_key=True)
    SupplierName = models.CharField(max_length=255)

    def __str__(self):
        return self.SupplierName


class Categories(models.Model):
    CategoryId = models.AutoField(primary_key=True)
    CategoryName = models.CharField(max_length=255)
    Durable = models.BooleanField(default=False)

    def __str__(self):
        return self.CategoryName


class Products(models.Model):
    ProductId = models.AutoField(primary_key=True)
    ProductName = models.CharField(max_length=255)
    SupplierId = models.ForeignKey(Suppliers, on_delete=models.CASCADE)
    CategoryId = models.ForeignKey(Categories, on_delete=models.CASCADE)
    UnitPrice = models.DecimalField(max_digits=10, decimal_places=2)
    UnitsInStock = models.IntegerField()
    UnitsOnOrder = models.IntegerField()
    UnitsSoldInStore = models.IntegerField()
    Suspended = models.BooleanField(default=False)

    # def total_income(self):
    #     return self.UnitPrice * (self.UnitsSoldInStore + self.UnitsOnOrder)

    def units_after_sales(self):
        return self.UnitsInStock - (self.UnitsSoldInStore + self.UnitsOnOrder)

    def __str__(self):
        return f"{self.ProductName} (Category: {self.CategoryId.CategoryName}, Supplier: {self.SupplierId.SupplierName})"
