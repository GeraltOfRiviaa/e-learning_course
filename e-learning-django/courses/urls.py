from django.urls import path
from . import views

urlpatterns = [
    path("<int:id>/", views.course_id, name="detail"),
    path("all", views.courses, name="overview"),
]