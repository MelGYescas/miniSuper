from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    # Create view
    path("create/", views.create, name="create"),
    # Update view
    path("update/<int:id>/", views.update, name="update"),
    # Delete view
    path("delete/<int:id>/", views.delete, name="delete"),
    # Total
    path("sales/", views.total_income_over_30_units, name="total_income_over_30_units"),
    # d
    path(
        "exist/", views.remaining_units_after_sales, name="remaining_units_after_sales"
    ),
    # non_perishable
    path(
        "non_perishable/",
        views.non_perishable_products,
        name="non_perishable",
    ),
    # top_web_sales
    path(
        "top_web_sales/",
        views.top_web_sales,
        name="top_web_sales",
    ),
]
