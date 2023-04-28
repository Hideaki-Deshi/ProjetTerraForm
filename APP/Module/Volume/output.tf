# Affiche l'ID du volume EBS créé en sortie
output "ebs_volume_id" {
  description = "L'ID du volume EBS créé"
  value       = aws_ebs_volume.ebs-projet.id
}