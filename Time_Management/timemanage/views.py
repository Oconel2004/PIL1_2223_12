from django.contrib.auth import login, logout, authenticate
from django.shortcuts import render, redirect
from .models import Emploidutemps, Users
def accueil(request):
    # Vue pour afficher la page d'accueil
    emplois_du_temps = Emploidutemps.objects.all()
    return render(request, 'accueil.html', {'emplois_du_temps': emplois_du_temps})
def consulter_emploi_du_temps(request, emploi_du_temps_id):
    # Vue pour consulter un emploi du temps spécifique
    emploi_du_temps =Emploidutemps.objects.get(id=emploi_du_temps_id)
    return render(request, 'index.html', {'emploi_du_temps': emploi_du_temps})

def creer_compte(request):
    # Vue pour la création de compte utilisateur
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        role = request.POST['role']

        # Vérifier si l'utilisateur existe déjà
        if Users.objects.filter(username=username).exists():
            return render(request, 'creer_compte.html', {'error_message': 'Ce nom d\'utilisateur existe déjà.'})
        
        # Créer un nouvel utilisateur
        user = Users.objects.create_user(username=username, password=password, role=role)
        login(request, user)
        return redirect('accueil')
    
    return render(request, 'creer_compte.html')
def inscription(request):
    return render(request, 'creer_compte.html')
def inscription_confirmation(request):
    return render(request, 'index.html')

def connexion(request):
    
    
    return render(request, 'connexion.html')
def seconnecter(request):
    # Vue pour la connexion de l'utilisateur
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        # Authentifier l'utilisateur
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('accueil')
        else:
            return render(request, 'connexion.html', {'error_message': 'Nom d\'utilisateur ou mot de passe incorrect.'})
    return render(request, 'index.html')

def se_deconnecter(request):
    # Vue pour la déconnexion de l'utilisateur
    logout(request)
    return redirect('accueil')

# Create your views here.

def login(request):
    return render(request, 'connexion.html')

