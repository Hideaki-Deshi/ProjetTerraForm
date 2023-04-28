# Construction de l'EC2 avec Terraform sur AWS

## Description
La construction de l'EC2 est divisé en plusieurs module. On  retrouve l'architecture suivante:

App/
├── Modules/
│   ├── EC2/
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   ├── Networking/
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   ├── SecurityGroup/
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   ├── Volume/
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   └── Ami_find/
│       ├── main.tf
│       ├── output.tf
│       └── variables.tf
├── SecretKey/
│   ├── access_key
│   └── secret_key
├── main.tf
├── terraform.tfvars
└── variables.tf


# Sécurité 
Pour question de sécurité, un dossier SecretKey qui doit être accesible seulement via terraform comporte les clef d'accès.


# Module 

## Ami:
Le module AMI recherche l'AMI approprié pour lancer l'instance EC2 dynamiquement. Par défaut on prend l'OS Amazon qui se trouve dans variables.tf dans le dossier principal (./varibales.tf). Dans le fichier de surcharge ubuntu a été renseigné



## EC2:
Ce module va créer une instance EC2 dans AWS, il va effectuer plusieurs actions :
- Creer l'adresse IP élastisque (EIP) et l'attacher a l'instance,
- Creer un groupe de sécurité pour l'instance et ouvrir les ports requis pour permettre la communication avec l'instance,
- Appliquer les tags EC2 communs définis dans la variables 'instanceEC2Name' a l'instance EC2 créée.
Pour effectuer ces actions, le module EC2 utilise la ressource AWS pour lancer l'instance EC2, 'aws_security_group' pour créer le groupe de sécurité.   

## Networking:
Le module Networking permet de gérer la configuration réseau d'une instance Amazon EC2.
- 'main.tf' définit une ressource aws_eip qui associe une adresse IP élastique à l'instance EC2 spécifiée par l'ID de l'instance (instance_id). L'attribut vpc est défini sur true, indiquant que l'adresse IP élastique est utilisée dans un Virtual Private Cloud (VPC). 
- 'output.tf' génère une sortie nommée eip_id, qui retourne l'ID de l'adresse IP élastique créée par le module. 
- 'variables.tf' définit une variable appelée instance_id, qui doit être fournie en entrée lors de l'utilisation du module. Cette variable est de type chaîne et stocke l'ID de l'instance EC2 pour laquelle l'adresse IP élastique est requise.


## SecurityGroup
Ce module précise les ports à ouvrir, ici ce sont les ports 443, 80 en entré et sortie
Pour communiqué avec la machine en ssh le port 22 est ouvert aussi

Le module SecurityGroup permet de configurer un groupe de sécurité AWS. 
- 'main.tf' définit le fournisseur AWS et les clés d'accès nécessaires pour l'authentification. Il crée également un groupe de sécurité nommé "projetFinal" qui autorise le trafic entrant et sortant sur les ports 443 (HTTPS), 22 (SSH) et 80 (HTTP) pour toutes les adresses IP, spécifiées par la variable "allip" dans le fichier variables.tf. 
- 'output.tf' génère une sortie nommée "web" qui affiche le nom du groupe de sécurité créé. 
Dans l'ensemble, ce module permet de créer et configurer un groupe de sécurité AWS qui autorise l'accès à certains services via des ports spécifiques tout en gérant les règles de trafic entrant et sortant.

## Volume : 
Le module Volume permet de créer et de configurer un volume EBS (Elastic Block Store) dans AWS. 
- 'main.tf' contient la définition de la ressource aws_ebs_volume pour créer le volume avec les paramètres spécifiés, tels que la zone de disponibilité, la taille, le type de volume et les tags. 
- 'output.tf' définit une sortie pour afficher l'ID du volume EBS créé. 
- 'variables.tf' déclare les variables utilisées pour personnaliser la création du volume, comme la zone de disponibilité, la taille, le type de volume, le nom et les tags. 
Les utilisateurs peuvent ajuster ces variables pour répondre à leurs besoins spécifiques lors de la création et de la configuration d'un volume EBS sur AWS.


# Utilisation

## Installation
    1. Clonez ce dépôt Git sur votre machine locale.
    2. Exécutez terraform init pour initialiser Terraform.
        -> terraform init
    3. Exécutez terraform apply pour déployer les ressources sur AWS.
        -> terraform apply