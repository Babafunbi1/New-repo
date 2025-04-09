data "azuread_client_config" "current" {}

resource "azuread_application" "ad_app" {
  display_name = var.service_principal_name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "sp1" {
  app_role_assignment_required = true
  client_id = azuread_application.ad_app.client_id
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal_password" "sp1_pass" {
  service_principal_id = azuread_service_principal.sp1.id
}