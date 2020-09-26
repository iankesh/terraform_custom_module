output "azure_resource_group_name" {
  value = module.az_resource_group.az_rg_name
}

output "azure_vnet_name" {
  value = module.az_virtual_network.az_vnet_name
}

output "azure_vnet_location" {
  value = module.az_virtual_network.az_vnet_location
}

output "azure_vnet_address_space" {
  value = module.az_virtual_network.az_vnet_address_space
}

output "azure_subnet_name" {
  value = module.az_subnet.az_subnet_name
}

output "azure_subnet_address_prefix" {
  value = module.az_subnet.az_subnet_address_prefix
}

output "azure_public_ip_address" {
  value = module.az_public_ip.az_public_ip_address
}