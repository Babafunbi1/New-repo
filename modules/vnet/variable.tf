variable "location" {
  
}

variable "resource_group_name" {
  
}

variable "network_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "vnet_cidr" {
  default = ["10.0.0.0/16"]
}

variable "app_subnet_cidr" {
  default = ["10.0.1.0/24"]
}

variable "firewall_subnet_cidr" {
  default = ["10.0.2.0/24"]
}