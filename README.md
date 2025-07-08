# 🚀 SecureBank Pro – Azure Cloud Security Architecture (Free Tier Project)

**SecureBank Pro** is a cost-optimized, enterprise-grade cloud security reference architecture deployed on Microsoft Azure using Bicep Infrastructure-as-Code.

> 🔐 Built entirely using **Azure Free Tier + $100 credit**

---

## ✅ Project Highlights

| Layer            | Component                             | Purpose |
|------------------|----------------------------------------|---------|
| **Networking**   | VNet, Subnets, NSG                     | Isolated network zones with traffic control |
| **Security**     | Key Vault                              | Secure secret management |
| **Data Layer**   | Azure SQL Server & Database            | Secure database with login auth |
| **Observability**| Log Analytics Workspace                | Centralized logging and future diagnostics |
| **IaC**          | Bicep (ARM DSL)                        | Repeatable and secure deployments |

---

## 🏗️ Bicep Deployment Steps

```bash
# Step 1: Create resource group
az group create --name SecureBankRG3 --location "Central US"

# Step 2: Deploy core infra (network + logging)
az deployment group create \
  --resource-group SecureBankRG3 \
  --template-file ./bicep/core-infra.bicep

# Step 3: Deploy SQL + Key Vault
az deployment group create \
  --resource-group SecureBankRG3 \
  --template-file ./bicep/step2-secrets-and-db.bicep \
  --parameters adminPassword='YourStrongP@ssword123!'
