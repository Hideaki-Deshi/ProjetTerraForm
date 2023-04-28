# Crée un volume EBS avec les paramètres spécifiés
resource "aws_ebs_volume" "ebs-projet" {
  # Configure la zone de disponibilité du volume EBS
  availability_zone = var.availability_zone
  # Configure la taille du volume EBS en gigaoctets (GiB)
  size              = var.size
  # Configure le type de volume EBS (par exemple : gp2, gp3, io1, io2, st1, sc1)
  type              = var.volume_type

  # Fusionne les tags fournis par l'utilisateur avec le tag "Name"
  tags = merge(
    var.tags,
    {
      "Name" = var.name
    }
  )
}