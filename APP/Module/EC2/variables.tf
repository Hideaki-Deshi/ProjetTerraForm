# Défini et provisionne les infrastructures
variable "aws_ami" {
  type        = string
  description = "ID de l'AMI de Amazon Linux utilisé par l'instance"
}

variable "instance_type" {
  type        = string
  description = " Type d'instance à démarrer"
}

variable "security_group_name" {
  type        = string
  description = "Nom du groupe de sécurité associé à l'instance"
}

variable "aws_common_tags" {
  type        = map(string)
  description = "Balises communes à appliquer aux ressources AWS"
  default     = {}
}

  