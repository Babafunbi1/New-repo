Azure Infrastructure Deployment with Terraform
This repository contains Terraform code to deploy a complete Azure infrastructure including networking, security, storage, and Kubernetes resources.

Terraform Azure Infrastructure Overview
This Terraform configuration deploys the following resources:
🗂 Resource Group – Base container for all Azure resources.
🌐 Virtual Network (VNet) – Custom network with dedicated application and firewall subnets.
🔒 Network Security Groups (NSGs) – Controls inbound and outbound traffic for the subnets.
🔥 Azure Firewall – Secures traffic within the VNet.
💾 Storage Account – Provides persistent storage for applications and state data.
🔑 Service Principal – Handles authentication for AKS and Key Vault.
🛡 Role Assignment – Assigns the Contributor role to the Service Principal.
🔐 Key Vault – Securely stores secrets and credentials.
☸️ AKS Cluster – Deploys Azure Kubernetes Service for container workloads.
🖥 Local Kubeconfig Export – Generates kubeconfig for kubectl access to the AKS cluster.


Resource Group
│
├── Virtual Network
│   ├── App Subnet ── NSG
│   └── Firewall Subnet ── NSG ── Azure Firewall
│
├── Storage Account
├── Service Principal ── Role Assignment (Contributor)
├── Key Vault ── Stores SP credentials
└── AKS Cluster ── Uses SP credentials for authentication


| Module                | Description                                      |
| --------------------- | ------------------------------------------------ |
| **VNet**              | Creates VNet with subnets.                       |
| **NSG**               | Configures NSGs and associates with subnets.     |
| **Firewall**          | Deploys Azure Firewall in firewall subnet.       |
| **Storage**           | Creates Storage Account with tags.               |
| **Service Principal** | Creates Azure AD Service Principal.              |
| **Key Vault**         | Creates Key Vault and grants access to SP.       |
| **AKS**               | Deploys AKS cluster using SP for authentication. |
