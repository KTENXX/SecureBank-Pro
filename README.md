# SecureBank Pro 🔐💻  
**An Advanced Azure Cloud Security Architecture Project**

SecureBank Pro is a senior-level cloud security architecture blueprint designed to demonstrate Zero Trust implementation using Azure-native tools. The solution models a secure, real-world deployment for a fictional banking app running on Azure App Service and backed by an Azure SQL Database. It features secrets management, RBAC, monitoring, and threat protection—all provisioned via Bicep Infrastructure as Code (IaC).

---

## 🧭 Project Overview

| Phase | Title                        | Description                                                                 |
|-------|------------------------------|-----------------------------------------------------------------------------|
| 1     | Resource Group & Network     | Set up project scope, region, resource group, and naming conventions.       |
| 2     | Secrets & SQL Database       | Deploy Key Vault with secrets, SQL server, and secure connection string.    |
| 3     | Web App & Identity           | Deploy Node.js App on App Service, connect to Key Vault & SQL via MSI.      |
| 4     | Monitoring                   | Enable App Insights, Log Analytics, and diagnostic settings for visibility. |
| 5     | Defender for Cloud           | Enable Microsoft Defender for SQL, App Service, Key Vault, and monitor secure score. |

---

## ⚙️ Tech Stack

- **Azure App Service (Linux)**
- **Azure SQL Database**
- **Azure Key Vault**
- **Azure Bicep**
- **Azure Log Analytics**
- **Azure Monitor**
- **Defender for Cloud**
- **Node.js & Express**

---

## 🔐 Security Features

- Secrets stored in **Azure Key Vault**, accessed via **Managed Identity**.
- SQL Admin password not hardcoded—retrieved securely at runtime.
- Web App uses system-assigned identity for zero-credential access.
- Diagnostic logs sent to **Log Analytics** workspace.
- Defender for Cloud activated for core resources.

---

## 📁 Project Structure

```

SecureBank-Pro/
│
├── app/                        # Node.js application
│   ├── index.js
│   └── package.json
│
├── bicep/                      # All infrastructure-as-code files
│   ├── step1-core.bicep
│   ├── step2-secrets-and-db.bicep
│   ├── step3-app-and-identity.bicep
│   └── step4-monitoring.bicep
│
└── README.md                   # You're here!

````

---

## 🚀 Deployment Steps

### ✅ Prerequisites

- Azure CLI logged in
- `az bicep` installed and up to date
- Node.js + npm installed (for the app)
- GitHub repo created (optional)

---

### 🧱 Step 1: Core Infrastructure

```bash
az deployment group create \
  --resource-group SecureBankRG3 \
  --template-file ./bicep/step1-core.bicep
````

---

### 🔐 Step 2: Key Vault + SQL

```bash
az deployment group create \
  --resource-group SecureBankRG3 \
  --template-file ./bicep/step2-secrets-and-db.bicep \
  --parameters adminPassword='YOUR_ADMIN_PASSWORD'
```

---

### 🌐 Step 3: App + Identity

```bash
az deployment group create \
  --resource-group SecureBankRG3 \
  --template-file ./bicep/step3-app-and-identity.bicep \
  --parameters keyVaultName=sbp-kv-kelvin20250708
```

> ⚠️ Then deploy the app:

```bash
cd app
npm install
zip -r app.zip *
az webapp deploy \
  --resource-group SecureBankRG3 \
  --name sbp-webapp-kelvin \
  --src-path app.zip \
  --type zip
```

---

### 📊 Step 4: Monitoring

```bash
az deployment group create \
  --resource-group SecureBankRG3 \
  --template-file ./bicep/step4-monitoring.bicep
```

> 📈 View Logs:

```bash
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppRequests | take 5" \
  --out table
```

---

### 🛡️ Step 5: Defender for Cloud

```bash
az provider register --namespace Microsoft.Security
az security pricing create --name AppServices --tier 'Standard'
az security pricing create --name SqlServers --tier 'Standard'
az security pricing create --name KeyVaults --tier 'Standard'
```

> ✅ Verify pricing tiers:

```bash
az security pricing list --query "[?pricingTier=='Standard'].{Resource:name, Tier:pricingTier}" -o table
```

---

## 📌 Key Takeaways

* Zero-trust access with managed identity
* Fully automated infrastructure using Bicep
* No secrets exposed in app code
* Logging, monitoring, and threat detection enabled
* Industry-grade project to impress recruiters

---

## 👨‍💻 Author

**Kelvin Arigbe**
*Cloud Security Enthusiast | Azure Certified | DevSecOps Focused*

GitHub: [KTENXX](https://github.com/KTENXX)

---

## 🧠 License

This project is licensed for educational purposes only. Please fork and adapt as needed
