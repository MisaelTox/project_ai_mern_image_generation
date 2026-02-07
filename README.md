# Build and Deploy a Full Stack MERN AI Image Generation App  MidJourney & DALL E Clone
![Image Generation App](https://i.ibb.co/p0f27C2/Thumbnail-9.png)

### [🌟 Become a top 1% Next.js 13 developer in only one course](https://jsmastery.pro/next13)
### [🚀 Land your dream programming job in 6 months](https://jsmastery.pro/masterclass)

### Launch your development career with project-based coaching - https://www.jsmastery.pro


# AI Image Generation Stack (DALL-E + MERN)
### *Modernization, Containerization, and Infrastructure as Code*

This project is an enhanced version of a MERN-stack AI showcase. My contribution focused on **architecting the cloud infrastructure** and transforming a local application into a containerized, production-ready system using DevOps best practices.

---

## 🛠️ My Technical Contributions

I took the core application logic and implemented the following **architectural milestones**:

* **Infrastructure as Code (IaC):** Designed and deployed the entire AWS ecosystem (EC2, Security Groups, VPC) using **Terraform**.
* **Container Orchestration:** Architected a multi-container environment with **Docker & Docker-Compose**, ensuring seamless communication between the React frontend and Node.js backend.
* **Cloud Lifecycle Management:** Managed the full deployment cycle on **AWS**, including the final decommissioning of resources to optimize cloud costs.
* **Production Debugging:** Resolved critical networking bottlenecks, including CORS policy configurations, environment variable injection in Vite, and Linux-side Docker permissions.

---

## 🌐 Deployment Status
* **Status:** **Offline** (Infrastructure decommissioned via `terraform destroy` to optimize cloud costs).
* **Original Environment:** AWS EC2 (Amazon Linux).
* **Architecture Blueprint:** All IaC configurations are available in the `/terraform` directory for review.



---

## 🛠️ Tech Stack & Skills

| Layer | Technology | Key Skill Demonstrated |
| :--- | :--- | :--- |
| **Infrastructure** | **Terraform** | Infrastructure as Code (IaC) |
| **Deployment** | **Docker / Docker-Compose** | Containerization & Orchestration |
| **Cloud** | **AWS (EC2, VPC, SG)** | Public Cloud Administration |
| **Frontend** | React.js, Tailwind CSS, Vite | Frontend Modernization |
| **Backend** | Node.js, Express.js | API Management & Debugging |
| **Database** | MongoDB Atlas | Cloud Database Integration |

---

## 📦 Project Structure

```text
├── terraform/       # My IaC configuration files (AWS Blueprint)
├── docker-compose.yml # Service orchestration
├── client/          # Frontend (Optimized for Docker builds)
└── server/          # Backend (Configured for Cloud environments)


🛡️ Key Challenges Overcome
Automated Provisioning: Successfully replaced manual AWS setup with a repeatable Terraform script, ensuring the Security Groups (ports 5173, 8080) were correctly configured by code.

Network Resolution: Fixed "Unexpected token" errors caused by incorrect IP routing between containers in the production environment.

Cost-Effective Scalability: Implemented a clean teardown process using Terraform to ensure no orphaned resources remained in the cloud.

Enhanced & Engineered by Misael Toxcatl Showcasing DevOps, Cloud Architecture, and Full-Stack Engineering skills.
