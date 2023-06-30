from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from .models import Emploidutemps, Users, Promotion
from .forms import EmploiDuTempsForm



def accueil(request):
    # Vue pour afficher la page d'accueil
    return render(request, 'accueil.html')

def inscription(request):
    if request.method == 'POST':
        numero_matricule = request.POST['numero_matricule']
        username = request.POST['username']
        password = request.POST['password']

        # Vérifier si le numéro de matricule existe dans la base de données
        if Users.objects.filter(numero_matricule=numero_matricule).exists():
            # Récupérer l'utilisateur correspondant au numéro de matricule
            user = Users.objects.get(numero_matricule=numero_matricule)
            # Mettre à jour les champs Username et mot de passe de l'utilisateur
            user.username = username
            user.password = password
            user.save()
            return redirect('connexion')
        else:
            error = 'Le numéro de matricule n\'existe pas.'

        return render(request, 'creer_compte.html', {'error': error})
    else:
        return render(request, 'creer_compte.html')

def connexion(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        # Vérifier les informations d'identification de l'utilisateur
        if Users.objects.filter(username=username, password=password).exists():
            # return redirect('dashboard_etudiant')
           user = Users.objects.get(username=username, password=password)
           if user.role == 'etudiant':
                return redirect('dashboard_etudiant')  # Rediriger vers le tableau de bord de l'étudiant
           elif user.role == 'administration':
                return redirect('dashboard_admin')  # Rediriger vers le tableau de bord de l'administration

        else:
            error = 'Les informations d\'identification sont incorrectes.'

        return render(request, 'connexion.html', {'error': error})
    else:
        return render(request, 'connexion.html')

def dashboard_admin(request):
    # Récupérer toutes les promotions
    promotions = Promotion.objects.all()

    # Récupérer tous les emplois du temps
    emplois_du_temps = Emploidutemps.objects.all()

    context = {
        'promotions': promotions,
        'emplois_du_temps': emplois_du_temps
    }

    return render(request, 'dashboard_admin.html', context)

def dashboard_etudiant(request):
    # Vérifier si l'utilisateur est connecté
    if request.user.is_authenticated:
        # Vérifier si l'utilisateur a un attribut 'id_promotion'
        if hasattr(request.user, 'id_promotion'):
            # Récupérer l'objet Promotion de l'utilisateur
            promotion = request.user.id_promotion
            # Récupérer les emplois du temps de la promotion de l'utilisateur
            emplois_du_temps = Emploidutemps.objects.filter(id_promotion=promotion)
            # Autres opérations à effectuer pour le dashboard de l'étudiant

            return render(request, 'dashboard_etudiant.html', {'emplois_du_temps': emplois_du_temps})
    
    # Gérer le cas où l'utilisateur n'est pas connecté ou n'a pas l'attribut 'id_promotion'
    return redirect('connexion')  # Rediriger vers la page de connexion


def ajouter_emploi(request):
    if request.method == 'POST':
        form = EmploiDuTempsForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('dashboard_admin')
    else:
        form = EmploiDuTempsForm()

    context = {
        'form': form
    }

    return render(request, 'ajouter_emploi.html', context)
def modifier_emploi(request, emploi_id):
    emploi_du_temps = Emploidutemps.objects.get(id_emploi=emploi_id)

    if request.method == 'POST':
        form = EmploiDuTempsForm(request.POST, instance=emploi_du_temps)
        if form.is_valid():
            form.save()
            return redirect('dashboard_admin')
    else:
        form = EmploiDuTempsForm(instance=emploi_du_temps)

    context = {
        'form': form,
        'emploi_du_temps': emploi_du_temps
    }

    return render(request, 'modifier_emploi.html', context)
def deconnexion(request):
    # Vue pour la déconnexion de l'utilisateur
    logout(request)
    return redirect('connexion')


