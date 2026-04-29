from django.http import HttpResponse
from django.shortcuts import render
from .models import Course

# Create your views here.
def course_id(request, id):
    context = {
        "course" : Course.objects.get(pk=id)
    }
    return HttpResponse(context["course"])

