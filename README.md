# TP Cloud 1 – OpenTofu & MinIO

##  Introduction
Mise en place d’un environnement local avec MinIO (stockage S3) et OpenTofu (IaC).  
Objectif : lancer MinIO, créer un bucket, gérer les fichiers du site statique et déployer via OpenTofu.

##  Installation
Outils installés :
- MinIO
- OpenTofu

Dossier du projet : `C:\tp1-minio`

## Accès

Console : http://localhost:9001

API : http://localhost:9000

Identifiants : minioadmin / minioadmin

## Fichiers et commandes 

Lancement Minio:
```powershell
mkdir C:\minio-data      # créer le dossier où MinIO stocke les données
minio server C:\minio-data --console-address ":9001"   # lancer le serveur MinIO

##FICHIERS 

main.tf : provider MinIO + ressources (bucket + objets)
variables.tf : variables + identifiants sensibles
outputs.tf : affichage du bucket et des objets
index.html + style.css : site statique

## Commandes utilisée :

tofu init   # initialise le projet et télécharge le provider MinIO
tofu plan -var "minio_user=minioadmin" -var "minio_password=minioadmin"
# affiche que le bucket + fichiers vont être créés
tofu apply -var "minio_user=minioadmin" -var "minio_password=minioadmin"
# crée le bucket, upload index.html et style.css
tofu apply -var "minio_user=minioadmin" -var "minio_password=minioadmin"
# renvoie "No changes", donc tout correspond


## MinIO :

le bucket web est présent
index.html et style.css sont bien dedans
le site s’ouvre via :
http://localhost:9000/webbucket/index.html

## Suppression

tofu destroy   Je ne l’ai pas exécutée pour garder l’infrastructure visible pour la correction :)
