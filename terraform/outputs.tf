output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.mern_server.public_ip
}

output "app_url" {
  description = "URL to access the MERN application"
  value       = "http://${aws_instance.mern_server.public_ip}:5000"
}