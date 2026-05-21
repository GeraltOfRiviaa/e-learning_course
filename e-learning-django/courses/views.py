from django.http import HttpResponse
from django.shortcuts import render
from .models import Course

# Create your views here.
def course_id(request, id):
    context = {
        "course" : Course.objects.get(pk=id)
    }
    return HttpResponse(context["course"])

def courses(request):
    courses_all = Course.objects.order_by()
    output = ", ".join([c.title for c in courses_all])
    return HttpResponse(output)
