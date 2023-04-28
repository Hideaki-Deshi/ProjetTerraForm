# Déclare la variable availability_zone
variable "availability_zone" {
  description = "La zone de disponibilité où le volume EBS sera créé"
  type        = string
}

# Déclare la variable size
variable "size" {
  description = "La taille du volume EBS en gigaoctets (GiB)"
  type        = number
}

# Déclare la variable volume_type
variable "volume_type" {
  description = "Le type de volume EBS"
  type        = string
  default     = "gp2"
}

# Déclare la variable name
variable "name" {
  description = "Le nom du volume EBS"
  type        = string
}

# Déclare la variable tags
variable "tags" {
  description = "Une carte des balises à appliquer au volume EBS et au snapshot (si créé)"
  type        = map(string)
  default     = {}
}
