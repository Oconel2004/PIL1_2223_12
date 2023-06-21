from django.db import models

class Cours(models.Model):
    id_cours = models.AutoField(primary_key=True)
    nom_cours = models.CharField(max_length=20)
    heures_semaine = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'cours'


class Emploidutemps(models.Model):
    id_emploi = models.AutoField(primary_key=True)
    id_promotion = models.ForeignKey('Promotion', models.DO_NOTHING, db_column='id_promotion')
    id_cours = models.ForeignKey(Cours, models.DO_NOTHING, db_column='id_cours')
    id_salle = models.ForeignKey('Salle', models.DO_NOTHING, db_column='id_salle')
    id_users = models.ForeignKey('Users', models.DO_NOTHING, db_column='id_users')
    id_groupe = models.ForeignKey('Groupe', models.DO_NOTHING, db_column='id_groupe')
    id_profil = models.ForeignKey('Profil', models.DO_NOTHING, db_column='id_profil')
    jour_semaine = models.CharField(max_length=20)
    heure_debut = models.TimeField()
    heure_fin = models.TimeField()

    class Meta:
        managed = False
        db_table = 'emploidutemps'


class Groupe(models.Model):
    id_groupe = models.AutoField(primary_key=True)
    nom_groupe = models.CharField(max_length=10)
    description_groupe = models.TextField()

    class Meta:
        managed = False
        db_table = 'groupe'


class Profil(models.Model):
    id_profil = models.AutoField(primary_key=True)
    cod_profil = models.CharField(max_length=10)
    nom_profil = models.CharField(max_length=25)

    class Meta:
        managed = False
        db_table = 'profil'


class Promotion(models.Model):
    id_promotion = models.AutoField(primary_key=True)
    nom_promotion = models.CharField(max_length=25)

    class Meta:
        managed = False
        db_table = 'promotion'


class Salle(models.Model):
    id_salle = models.AutoField(primary_key=True)
    nom_salle = models.CharField(max_length=20)
    capacite = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'salle'


class Users(models.Model):
    id_users = models.AutoField(primary_key=True)
    numero_matricule = models.CharField(unique=True, max_length=255)
    nom = models.CharField(max_length=20)
    prenom = models.CharField(max_length=25)
    adresse_email = models.CharField(max_length=255)
    filiere = models.CharField(max_length=15)
    motpas = models.CharField(max_length=30)
    id_profil = models.ForeignKey(Profil, models.DO_NOTHING, db_column='id_profil')
    id_groupe = models.ForeignKey(Groupe, models.DO_NOTHING, db_column='id_groupe')
    id_promotion = models.ForeignKey(Promotion, models.DO_NOTHING, db_column='id_promotion')

    class Meta:
        managed = False
        db_table = 'users'
