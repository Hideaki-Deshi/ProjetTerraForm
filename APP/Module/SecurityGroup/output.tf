# Définit une sortie nommée "web" qui renvoie le nom du groupe de sécurité "nginx".
output "web" {
  value = aws_security_group.nginx.name
}
