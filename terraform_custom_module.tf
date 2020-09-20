# Module List:
# iankesh/resource-group/azure
# ankesh/virtual-network/azure

provider "azurerm" {
  version = "=2.20.0"
  features {}
}

module "az_resource_group" {
  source   = "../terraform-azure-resource-group"
  name     = "ankesh-workspace"
  location = "westeurope"
  team_tag = "DevOps"
  creator  = "ankesh"
}

module "az_virtual_network" {
  source              = "../terraform-azure-virtual-network"
  name                = "ankesh-vnet"
  resource_group_name = module.az_resource_group.az_rg_name
  # resource_group_name = "ankesh-workspace"
  address_space       = "10.0.2.0/24"
  env                 = "dev"
  team_tag            = "DevOps"
  creator             = "ankesh"
}

output "azure_resource_group_id" {
  value = module.az_resource_group.az_rg_id
}

output "azure_resource_group_name" {
  value = module.az_resource_group.az_rg_name
}

output "azure_vnet_id" {
  value = module.az_virtual_network.vnet_id
}

output "azure_vnet_name" {
  value = module.az_virtual_network.vnet_name
}

output "azure_vnet_location" {
  value = module.az_virtual_network.vnet_location
}

output "azure_vnet_address_space" {
  value = module.az_virtual_network.vnet_address_space
}
