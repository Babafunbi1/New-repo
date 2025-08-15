Azure Infrastructure Deployment with Terraform
This repository contains Terraform code to deploy a complete Azure infrastructure including networking, security, storage, and Kubernetes resources.

This Terraform configuration deploys:
Resource Group – Base container for all Azure resources.
Virtual Network (VNet) – Custom network with application and firewall subnets.
Network Security Groups (NSGs) – Security for the subnets.
Azure Firewall – Secures traffic within the VNet.
Storage Account – For persistent storage.
Service Principal – Provides authentication for AKS and Key Vault.
Role Assignment – Contributor role assigned to Service Principal.
Key Vault – Stores secrets securely.
AKS Cluster – Azure Kubernetes Service cluster for container workloads.
Local Kubeconfig – Exports AKS kubeconfig for kubectl access.


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
