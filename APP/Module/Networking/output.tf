output "eip_id" {
  description = "L'ID de l'adresse IP élastique"
  value       = aws_eip.myeip.id
}
