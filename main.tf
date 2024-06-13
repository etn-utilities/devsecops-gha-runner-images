module "vm" {
  source                    = "./modules/runner-vm"
  for_each                  = var.vm_configs
  location                  = each.value.location
  resource_group_name       = each.value.resource_group_name
  vnet_name                 = each.value.vnet_name
  vnet_resource_group_name  = each.value.vnet_resource_group_name
  subnet_name               = each.value.subnet_name
  vm_name                   = each.value.vm_name
  vm_size                   = each.value.vm_size
  gallery_name              = each.value.gallery_name
  image_name                = each.value.image_name
  os_type = each.value.os_type
  image_resource_group_name = each.value.image_resource_group_name
}