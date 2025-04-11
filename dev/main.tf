resource "azurerm_resource_group" "rg1" {
  name     = var.rgname
  location = var.location
}

module "vnet" {
  source              = "../modules/vnet"
  network_name        = var.network_name
  location            = var.location
  resource_group_name = var.rgname

  depends_on = [ azurerm_resource_group.rg1 ]

  tags = local.common_tags
}

module "nsg" {
  source              = "../modules/nsg"
  network_name        = var.network_name
  location            = var.location
  resource_group_name = var.rgname
  app_subnet_id       = module.vnet.app_subnet_id
  firewall_subnet_id  = module.vnet.firewall_subnet_id

  depends_on = [module.vnet]
}

module "firewall" {
  source              = "../modules/firewall"
  location            = var.location
  resource_group_name = var.rgname
  firewall_subnet_id  = module.vnet.firewall_subnet_id

  depends_on = [module.vnet]
}

module "storage" {
  source              = "../modules/storage"
  storage_account_name = var.storage_account_name
  location            = var.location
  resource_group_name = var.rgname

  tags = local.common_tags
}


module "ServicePrincipal" {
  source                 = "../modules/ServicePrincipal"
  service_principal_name = var.service_principal_name

  depends_on = [
    azurerm_resource_group.rg1
  ]
}

resource "azurerm_role_assignment" "rolespn" {

  scope                = "/subscriptions/${var.SUB_ID}"
  role_definition_name = "Contributor"
  principal_id         = module.ServicePrincipal.service_principal_object_id

  depends_on = [
    module.ServicePrincipal
  ]
}

module "keyvault" {
  source                      = "../modules/keyvault"
  keyvault_name               = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.rgname
  service_principal_name      = var.service_principal_name
  service_principal_object_id = module.ServicePrincipal.service_principal_object_id
  service_principal_tenant_id = module.ServicePrincipal.service_principal_tenant_id

  depends_on = [
    module.ServicePrincipal
  ]
}

resource "azurerm_key_vault_secret" "key_secret" {
  name         = module.ServicePrincipal.client_id
  value        = module.ServicePrincipal.client_secret
  key_vault_id = module.keyvault.keyvault_id

  depends_on = [
    module.keyvault
  ]
}

#create Azure Kubernetes Service
module "aks" {
  source                 = "../modules/aks/"
  ssh_public_key         = var.ssh_public_key
  service_principal_name = var.service_principal_name
  client_id              = module.ServicePrincipal.client_id
  client_secret          = module.ServicePrincipal.client_secret
  location               = var.location
  resource_group_name    = var.rgname
  cluster_name = var.cluster_name
  node_pool_name = var.node_pool_name

  depends_on = [
    module.ServicePrincipal
  ]

}

resource "local_file" "kubeconfig" {
  depends_on   = [module.aks]
  filename     = "./kubeconfig"
  content      = module.aks.config
  
}