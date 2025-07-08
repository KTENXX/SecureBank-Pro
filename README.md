# 🔐 SecureBank Pro – Azure Cloud Security Architecture (Free Tier Project)

SecureBank Pro is a real-world, enterprise-style Azure cloud security project built on a **$0/month free tier + $100 credit**. It simulates a secure banking environment and showcases:

- Infrastructure as Code (IaC) with **Azure Bicep**
- Secure App deployment using **Azure App Service (Linux + Node.js)**
- **Key Vault** integration via **Managed Identity**
- Secretless architecture (no hardcoded secrets)
- Full GitHub documentation and CLI deployment

---

## 📌 Quick Navigation

- [🔧 Phase 1 – Core Infrastructure](#-phase-1--core-infrastructure-provisioning)
- [🚀 Phase 2 – Secure App Deployment](#-phase-2--app--secrets-integration)
- [📊 Phase 3 – Monitoring & Security](#-phase-3--monitoring-logging-defender-coming-soon)
- [💻 Tech Stack](#-tech-stack)
- [📁 Project Structure](#-project-structure)
- [�� Deployment Guide](#-deployment-guide)

---

## �� Phase 1 – Core Infrastructure Provisioning

> **Goal:** Build foundational cloud resources using Bicep.

✅ Resource Group  
✅ App Service Plan (Linux)  
✅ Virtual Network (optional)  
✅ Prepared for expansion in later phases

```bash
az group create --name SecureBankRG3 --location centralus

az deployment group create \
  --resource-group SecureBankRG3 \
  --template-file bicep/core-infra.bicep

