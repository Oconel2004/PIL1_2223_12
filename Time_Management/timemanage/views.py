from django.shortcuts import render

# Create your views here.
def register(request):
    return render(request, 'inscription.html')

def login(request):
    return render(request, 'connexion.html')