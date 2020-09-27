# Module List:
# | iankesh/resource-group/azure
# | iankesh/virtual-network/azure
# | iankesh/subnet/azure
# | iankesh/security-group/azure
# | iankesh/public-ip/azure
# | iankesh/network-interface/azure
# | iankesh/virtual-machine/azure

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
  security_destination_port           = ["80", "22", "443"]
  security_source_address_prefix      = "*"
  security_destination_address_prefix = "*"
  env                                 = "dev"
  team_tag                            = "DevOps"
  creator                             = "ankesh"
}

module "az_public_ip" {
  source              = "../terraform-azure-public-ip"
  name                = "ankesh-public-ip"
  resource_group_name = module.az_resource_group.az_rg_name
  allocation          = "Static"
  ip_version          = "IPv4"
  env                 = "dev"
  team_tag            = "DevOps"
  creator             = "ankesh"
}

module "az_network_interface" {
  source                = "../terraform-azure-network-interface"
  name                  = "ankesh-network-interface"
  resource_group_name   = module.az_resource_group.az_rg_name
  vnet_name             = module.az_virtual_network.az_vnet_name
  subnet_name           = module.az_subnet.az_subnet_name
  private_ip_allocation = "Dynamic"
  public_ip_id          = module.az_public_ip.az_public_ip_id
  public_ip_name        = module.az_public_ip.az_public_ip_name
}

module "az_virtual_machine" {
  source                 = "../terraform-azure-virtual-machine"
  name                   = "ankesh-vm"
  resource_group_name    = module.az_resource_group.az_rg_name
  network_interface_name = module.az_network_interface.az_network_interface_name
  size_vm                = "Standard_D2_v2"
  os_disk_name           = "ankesh-vm-disk"
  os_profile_name        = "ankesh-vm-host"
  os_profile_username    = "devops"
  os_profile_password    = "Devops123456789"
  env                    = "dev"
  team_tag               = "DevOps"
  creator                = "ankesh"
}
