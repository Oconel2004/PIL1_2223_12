"""
URL configuration for school_app project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.contrib.auth.decorators import login_required
from django.urls import path
from timemanage.views import  login, inscription, accueil, connexion, dashboard_admin, dashboard_etudiant, ajouter_emploi, modifier_emploi, deconnexion
from django.contrib.auth import views as auth_views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', accueil, name='accueil'),
    path('inscription/', inscription, name='inscription'),
    path('connexion/', connexion, name='connexion'),
    path('deconnexion/', deconnexion, name='deconnexion'),
    path('dashboard_admin/', dashboard_admin, name='dashboard_admin'),
    path('dashboard_etudiant/', dashboard_etudiant, name='dashboard_etudiant'),
    path('ajouter_emploi/', ajouter_emploi, name='ajouter_emploi'),
    path('modifier_emploi/<int:emploi_id>/', modifier_emploi, name='modifier_emploi'),

]



