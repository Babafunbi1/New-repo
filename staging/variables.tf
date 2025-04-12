variable "rgname" {
  type        = string
  description = "resource group name"

}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "service_principal_name" {
  type = string
}

variable "keyvault_name" {
  type = string
}

variable "SUB_ID" {
  type = string
}

variable "node_pool_name" {
  
}
variable "cluster_name" {
  
}

variable "ssh_public_key" {
  description = "The SSH public key used to access AKS nodes"
  type        = string
}

variable "network_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}
