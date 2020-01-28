from django.shortcuts import render, reverse

# Create your views here.
def home(request):
    title = 'Home'
    return render(request, 'price_compare/base.html', {'title': title})