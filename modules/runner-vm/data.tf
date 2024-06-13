data "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  resource_group_name = var.vnet_resource_group_name
}

data "azurerm_subnet" "this" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.this.name
  resource_group_name  = var.vnet_resource_group_name
}

data "azurerm_image" "this" {
  name                = var.image_name
  resource_group_name = var.image_resource_group_name
}

data "azurerm_shared_image" "this" {
name = var.image_name
gallery_name = var.gallery_name
resource_group_name = var.image_resource_group_name
}    