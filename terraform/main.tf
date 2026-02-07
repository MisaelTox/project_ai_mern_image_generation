resource "aws_security_group" "mern_sg" {
  name        = "mern-app-sg"
  description = "Permitir trafico para React y Express"

  # Puerto para SSH (Para que tu puedas entrar al servidor)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Puerto para React (Frontend)
  ingress {
    from_port   = 5173
    to_port     = 5173
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Puerto para Express (API)
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Salida a internet (Para que el servidor descargue Docker)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "mern_server" {
  ami           = "ami-04233b5aecce09244" 
  instance_type = "t3.micro"
  key_name      = "key-ai-mern" # <--- Añade esto aquí
  
  vpc_security_group_ids = [aws_security_group.mern_sg.id]

  tags = {
    Name = "MERN-AI-Server"
  }

  # Script para que la máquina se configure sola al nacer
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y docker
              sudo service docker start
              sudo usermod -a -G docker ec2-user
              # Aquí podrías instalar también docker-compose
              EOF
}
