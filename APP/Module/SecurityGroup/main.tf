/* Le provider défini avec la région "us-east-1", ce qui signifie que toutes les ressources définies dans ce code sont créées dans cette région.
De plus, le code utilise les fonctions "file" pour récupérer l'access_key et le secret_key stockés dans les fichiers locaux "./SecretKey/access_key" et "./SecretKey/secret_key" respectivement. 
Ces informations sont utilisées pour qu'on puisse s'authentifier auprès d'AWS.*/

provider "aws" {
    region = "us-east-1"
    access_key = "${file("./SecretKey/access_key")}"
    secret_key = "${file("./SecretKey/secret_key")}"
}


# Crée un groupe de sécurité pour AWS avec le nom "projetFinal"
resource "aws_security_group" "nginx" {
  name = "projetFinal"

  # Autorise le trafic entrant sur le port 443
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [var.allip]
  }

  # Autorise le trafic entrant sur le port 22
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.allip]
  }

  # Autorise le trafic entrant sur le port 80
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.allip]
  }

  # Autorise le trafic sortant sur le port 443
  egress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [var.allip]
  }

  # Autorise le trafic sortant sur le port 80
  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.allip]
  }
}