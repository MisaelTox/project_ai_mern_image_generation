variable "aws_region" {
  description = "AWS region for infrastructure deployment"
  type        = string
  default     = "eu-north-1" 
}

variable "project_name" {
  description = "Base name for project resources"
  type        = string
  default     = "ai-mern-generator"
}

variable "instance_type" {
  description = "EC2 instance size"
  type        = string
  default     = "t3.micro" # Recommended for MERN + AI workloads
}

variable "key_name" {
  description = "Name of the existing AWS SSH Key Pair (.pem)"
  type        = string
}