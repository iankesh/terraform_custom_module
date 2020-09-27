module "az_virtual_machine" {
  source   = "../../terraform-azure-virtual-machine-standalone"
  base_name = "ankesh"
  size_vm = "Standard_D2_v2"
  os_disk_size = "30"
  image_publisher = "Canonical"
  image_offer = "UbuntuServer"
  image_version = "latest"
  image_sku = "18.04-LTS"
  os_profile_username = "devops"
  os_profile_password = "Devops123456789"
  location = "westeurope"
  creator  = "ankesh"
}