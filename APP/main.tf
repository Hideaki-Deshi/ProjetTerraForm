#Definition du provider d'infrastructure, avec les access stock dans le dossier SecretKey  
provider "aws" {
    region = var.region
    access_key = "${file("./SecretKey/access_key")}"
    secret_key = "${file("./SecretKey/secret_key")}"
}

# Module EC2 : Definition des parametres nécessaires pour lancer une instance EC2
module "EC2" {
  source = "./Module/EC2"
  aws_ami = module.ami-ID.AMI-ID
  instance_type = var.instancetype
  security_group_name = module.security.web
  aws_common_tags = var.instanceEC2Name # Tags communs a appliquer a l'instance EC2
}

#Module IP : Creation des ressources reseaux pour l'instance EC2
module "Networking" {
  source      = "./Module/Networking"
  instance_id = module.EC2.instance_id
}

#Module sécurité : Création des régles pour les groupes de sécurité
module "security"{
  source = "./Module/SecurityGroup"
  
}

#Définition des paramètres nécessaires pour trouver l'AMI approprié pour lancer l'instance EC2
module "ami-ID"{
  source = "./Module/Ami_find"
  OS = var.varOs
  filtre = var.filter-OS
}

#Création du volume EBS, tels que la taille, le type et la zone de disponibilité, et l'attacher à l'instance EC2. 
module "ebs_volume" {
  source = "./Module/Volume"
  availability_zone = var.region
  size              = 100
  volume_type       = "gp3"
  name              = var.instanceEbsName
  tags = {
    Terraform   = "true"   
  }

}
