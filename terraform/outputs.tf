output "server_public_ip" {
  description = "La IP pública de mi nuevo servidor"
  value       = aws_instance.mern_server.public_ip
}