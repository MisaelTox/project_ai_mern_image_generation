resource "aws_security_group" "mern_sg" {
  name        = "${var.project_name}-sg"
  description = "Allow inbound traffic for MERN stack"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Puerto para el Frontend (Vite)
  ingress {
    from_port   = 5173
    to_port     = 5173
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Puerto para el Backend (Node/Express)
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 2. Búsqueda de la imagen de Ubuntu 24.04 (Free Tier)
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

# 3. Recurso de la Instancia EC2
resource "aws_instance" "mern_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.mern_sg.id]

  # Script de configuración automática
  user_data = <<-EOF
              #!/bin/bash
              # Redirigir salida a logs para diagnóstico
              exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
              
              echo "--- Iniciando configuración de Ubuntu ---"
              apt-get update -y
              
              # Instalación de dependencias (Docker y Git)
              apt-get install -y docker.io git docker-compose-v2
              
              # Habilitar y arrancar Docker
              systemctl enable --now docker
              
              # Agregar el usuario ubuntu al grupo docker
              usermod -aG docker ubuntu
              
              # Preparar directorio de la aplicación
              mkdir -p /home/ubuntu/app
              cd /home/ubuntu/app
              
              # Clonar el repositorio
              git clone https://github.com/MisaelTox/project_ai_mern_image_generation.git .
              
              # Crear el archivo .env dentro de la carpeta server
              mkdir -p server
              cat <<EOT > server/.env
              MONGODB_URL=mongodb://mongodb:27017/mern_ai
              OPENAI_API_KEY=PLACEHOLDER_REPLACE_ME_VIA_SSH
              EOT
              
              # Corregir permisos para que el usuario ubuntu sea dueño de los archivos
              chown -R ubuntu:ubuntu /home/ubuntu/app
              
              echo "--- Lanzando contenedores con Docker Compose ---"
              # Ejecutar como root el build inicial
              docker compose up -d --build
              
              echo "Despliegue finalizado con éxito."
              EOF

  tags = {
    Name = var.project_name
  }
}