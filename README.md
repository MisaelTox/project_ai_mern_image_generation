# MERN AI Image Generation — AWS Cloud Infrastructure

![CI/CD](https://github.com/MisaelTox/project_ai_mern_image_generation/actions/workflows/ci-cd.yml/badge.svg?branch=main)
![AWS](https://img.shields.io/badge/AWS-EC2-orange?logo=amazon-aws)
![Terraform](https://img.shields.io/badge/IaC-Terraform-purple?logo=terraform)
![Docker](https://img.shields.io/badge/Container-Docker%20Compose-blue?logo=docker)

Production-ready cloud deployment of a MERN stack AI image generation app (DALL-E/MidJourney style), showcasing Infrastructure as Code, container orchestration, and automated CI/CD on AWS.

> **Deployment Status:** Offline — infrastructure decommissioned via `terraform destroy` to avoid ongoing costs. All IaC configs available in `/terraform` for review.

---

## 🏗️ Architecture

| Layer | Technology |
|-------|-----------|
| Infrastructure | AWS EC2 + Security Groups + VPC |
| IaC | Terraform |
| Orchestration | Docker Compose (3-tier) |
| Frontend | React + Vite (port 5173) |
| Backend | Node.js + Express (port 8080) |
| Database | MongoDB (containerized) |
| CI/CD | GitHub Actions |

---

## 🔄 CI/CD Pipeline

Every push to `main` runs two parallel jobs before requesting approval:
```
Push to main
      ↓
✅ Terraform CI (parallel)    ✅ Docker Build Check (parallel)
   → terraform fmt               → docker compose build
   → terraform validate          → verifies all 3 images build
      ↓                               ↓
      └──────────── both pass ────────┘
                      ↓
           ⏸️ Manual approval gate
                      ↓
            🚀 terraform apply → provisions EC2
```

AWS credentials stored as **GitHub Secrets** — never hardcoded.

---

## 🚀 Deployment
```bash
cd terraform
terraform init
terraform apply -auto-approve
```

The `user_data` script automatically installs Docker, clones the repo, and builds all images on the EC2 instance (~5-8 min). Access the app at `http://<EC2_PUBLIC_IP>:5173`.

---

## 📝 Lessons Learned

- **CI/CD with GitHub Actions** — parallel Terraform + Docker Compose validation with manual approval gate before any AWS provisioning
- **Buildx compatibility** — fixed Docker Compose build failures on Amazon Linux 2023 by migrating to Ubuntu 24.04 which includes modern `docker-buildx` plugins
- **Security hardening** — least privilege Security Groups exposing only ports 22, 5173, and 8080
- **Service synchronization** — orchestrated container startup order via Docker Compose `depends_on` to ensure MongoDB is ready before the backend connects
- **CORS & environment variables** — resolved cross-container networking issues and Vite environment variable injection in production

---

*Fork of [adrianhajdin/project_ai_mern_image_generation](https://github.com/adrianhajdin/project_ai_mern_image_generation). Cloud infrastructure, containerization, and CI/CD pipeline added by MisaelTox.*