from django.db import models
from django.contrib.auth.models import AbstractUser

class Utilisateur(AbstractUser):
    # Champs supplémentaires pour l'utilisateur
    role = models.CharField(max_length=100)
    # Autres champs spécifiques à l'utilisateur (nom, prénom, etc.)

class Filiere(models.Model):
    nom = models.CharField(max_length=100)

    def __str__(self):
        return self.nom

class Enseignant(models.Model):
    nom = models.CharField(max_length=100)
    # Autres champs spécifiques à l'enseignant

    def __str__(self):
        return self.nom

class Salle(models.Model):
    nom = models.CharField(max_length=100)
    # Autres champs spécifiques à la salle

    def __str__(self):
        return self.nom

class Cours(models.Model):
    nom = models.CharField(max_length=100)
    # Autres champs spécifiques au cours

    def __str__(self):
        return self.nom

class EmploiDuTemps(models.Model):
    promotion = models.CharField(max_length=100)
    filiere = models.ForeignKey(Filiere, on_delete=models.CASCADE)
    jour = models.CharField(max_length=100)
    heure_debut = models.TimeField()
    heure_fin = models.TimeField()
    cours = models.ForeignKey(Cours, on_delete=models.CASCADE)
    enseignant = models.ForeignKey(Enseignant, on_delete=models.CASCADE)
    salle = models.ForeignKey(Salle, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.promotion} - {self.jour} - {self.heure_debut}-{self.heure_fin}"

