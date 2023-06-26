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
from django.urls import path
from timemanage.views import  login
from timemanage.views import consulter_emploi_du_temps,creer_compte,se_deconnecter,connexion,accueil,inscription,inscription_confirmation,seconnecter
from django.contrib.auth import views as auth_views
urlpatterns = [
    path('admin/', admin.site.urls),
    path('accueil', accueil, name='accueil'),
    path('emploi-du-temps/<int:emploi_du_temps_id>/', consulter_emploi_du_temps, name='consulter_emploi_du_temps'),
    path('creer-compte/', creer_compte, name='creer_compte'),
    path('connexion/', connexion, name='se_connecter'),
    path('se-deconnecter/',se_deconnecter, name='se_deconnecter'),
    path('inscription_confirmation/',inscription_confirmation, name='inscription'),
    path('seconnecter/',seconnecter, name='seconnecter'),
    path('password_reset/', auth_views.PasswordResetView.as_view(template_name="password_reset.html"), name='password_reset'),
    path('reset_password/done/', auth_views.PasswordResetDoneView.as_view(template_name="password_reset_done.html"), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name="password_reset_confirm.html"), name='password_reset_confirm'),
    path('reset/done/', auth_views.PasswordResetCompleteView.as_view(template_name="complete.html"), name='password_reset_complete'),
]



