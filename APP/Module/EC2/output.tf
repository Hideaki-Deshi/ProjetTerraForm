# Déscription de l'infrastructure cloud de manière déclarative.
output "instance_id" {
  description = "ID de l'instance"
  value       = aws_instance.EC2-Projet.id
}
