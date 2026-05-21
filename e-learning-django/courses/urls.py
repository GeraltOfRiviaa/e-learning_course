from django.urls import path
from . import views

urlpatterns = [
<<<<<<< HEAD
    path("<int:id>/", views.course_id, name="overview"),
    
=======
    path("<int:id>/", views.course_id, name="detail"),
    path("all", views.courses, name="overview"),
>>>>>>> da183ee2c46aa35b20a82546d6710e46ce7607b4
]