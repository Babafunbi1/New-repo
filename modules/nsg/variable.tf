variable "location" {
  
}

variable "resource_group_name" {
  
}

variable "network_name" {
  type = string
}

variable "app_subnet_id" {
  description = "ID of the application subnet"
  type        = string
}

variable "firewall_subnet_id" {
  description = "ID of the Firewall Subnet"
  type = string
}