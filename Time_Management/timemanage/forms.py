from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import Emploidutemps

class EmploiDuTempsForm(forms.ModelForm):
    class Meta:
        model = Emploidutemps
        fields = ['jour_semaine', 'heure_debut', 'heure_fin', 'cours', 'salle', 'enseignant', 'id_promotion']

        widgets = {
            'id_promotion': forms.Select(attrs={'class': 'form-control'}),
        }