# Définition de l'adresse IP élastique
resource "aws_eip" "myeip" {
  instance = var.instance_id
  vpc      = true
}


