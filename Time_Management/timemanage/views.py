from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from .models import EmploiDuTemps, Utilisateur

def accueil(request):
    # Vue pour afficher la page d'accueil
    emplois_du_temps = EmploiDuTemps.objects.all()
    return render(request, 'accueil.html', {'emplois_du_temps': emplois_du_temps})

def consulter_emploi_du_temps(request, emploi_du_temps_id):
    # Vue pour consulter un emploi du temps spécifique
    emploi_du_temps = EmploiDuTemps.objects.get(id=emploi_du_temps_id)
    return render(request, 'emploi_du_temps.html', {'emploi_du_temps': emploi_du_temps})

def creer_compte(request):
    # Vue pour la création de compte utilisateur
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        role = request.POST['role']

        # Vérifier si l'utilisateur existe déjà
        if Utilisateur.objects.filter(username=username).exists():
            return render(request, 'inscription.html', {'error_message': 'Ce nom d\'utilisateur existe déjà.'})
        
        # Créer un nouvel utilisateur
        user = Utilisateur.objects.create_user(username=username, password=password, role=role)
        login(request, user)
        return redirect('accueil')
    
    return render(request, 'inscription.html')

def se_connecter(request):
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
    
    return render(request, 'connexion.html')

def se_deconnecter(request):
    # Vue pour la déconnexion de l'utilisateur
    logout(request)
    return redirect('accueil')
