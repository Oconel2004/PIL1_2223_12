from django.db import models


class Emploidutemps(models.Model):
    id_emploi = models.AutoField(primary_key=True)
    id_promotion = models.ForeignKey('Promotion', models.DO_NOTHING, db_column='id_promotion')
    cours = models.CharField(max_length=100)
    salle = models.CharField(max_length=100)
    enseignant = models.CharField(max_length=100)
    jour_semaine = models.CharField(max_length=20)
    heure_debut = models.CharField(max_length=20)
    heure_fin = models.CharField(max_length=20)
    def get_nom_promotion(self):
        return self.id_promotion.nom_promotion



class Promotion(models.Model):
    id_promotion = models.AutoField(primary_key=True)
    nom_promotion = models.CharField(max_length=25)

class Users(models.Model):
    numero_matricule = models.CharField(unique=True, max_length=255)
    nom = models.CharField(max_length=100)
    prenom = models.CharField(max_length=100)
    adresse_email = models.CharField(max_length=255)
    filiere = models.CharField(max_length=100)
    role = models.CharField(max_length=100)
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=50)
    id_promotion = models.ForeignKey(Promotion, models.DO_NOTHING, db_column='id_promotion')

