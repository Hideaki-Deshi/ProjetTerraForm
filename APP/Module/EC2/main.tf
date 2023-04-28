# Définition de la ressource d'instance EC2 avec les valeurs variabilisées
resource "aws_instance" "EC2-Projet" {
  ami             = var.aws_ami
  instance_type   = var.instance_type
  key_name        = "devops-stan"
  tags            = var.aws_common_tags
  vpc_security_group_ids = [var.security_group_name]
  root_block_device {
    delete_on_termination = true
  }

    # Provisioning de l'instance avec Nginx
  provisioner "remote-exec" {

    inline = [
      "sudo apt update",  # update des source.lst
      "sudo apt install nginx -y", # installation de nginx
      "sudo systemctl start nginx"# Démarrage de Nginx
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("devops-stan.pem")
      host        = self.public_ip
      timeout = "300s"
    }
  }

  provisioner "local-exec" {
    command = "echo IP: ${aws_instance.EC2-Projet.public_ip} > IP_EC2.txt"
  }
}
