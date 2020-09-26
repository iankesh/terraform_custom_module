# Module List:
# | iankesh/resource-group/azure
# | iankesh/virtual-network/azure
# | iankesh/subnet/azure
# | iankesh/security-group/azure

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

module "az_subnet" {
  source              = "../terraform-azure-subnet"
  name                = "ankesh-subnet"
  resource_group_name = module.az_resource_group.az_rg_name
  vnet_name           = module.az_virtual_network.az_vnet_name
  address_prefix      = "10.0.2.0/26"
}

module "az_security_group" {
  source                              = "../terraform-azure-security-group"
  name                                = "ankesh-security-group"
  resource_group_name                 = module.az_resource_group.az_rg_name
  security_rule_name                  = "ankesh-security-rule"
  security_priority                   = "101"
  security_direction                  = "Inbound"
  security_access                     = "Allow"
  security_protocol                   = "Tcp"
  security_source_port                = "*"
  security_destination_port           = ["80" , "22", "443"]
  security_source_address_prefix      = "*"
  security_destination_address_prefix = "*"
  env                                 = "dev"
  team_tag                            = "DevOps"
  creator                             = "ankesh"
}
