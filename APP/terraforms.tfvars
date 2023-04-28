#Type d'instance a lancer
instancetype = "t2.micro"

#Nom de l'instance
instanceEC2Name = {
    Name = "EC2-Projet"
}

#Nom du volume EBS a créer
instanceEbsName = "ebs-projet"

#ID du compte AWS propriétaire des images AMI Ubuntu officielles
varOs = "099720109477"

#Filtre pour trouver la dernière version de l'image AMI Ubuntu 18.04 disponible
filter-OS = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
