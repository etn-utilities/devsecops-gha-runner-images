resource "azurerm_network_interface" "this" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.this.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "this" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.this.id]
  vm_size               = var.vm_size

  storage_image_reference {
    id = data.azurerm_shared_image.this.id
  }

  storage_os_disk {
    name              = "${var.vm_name}_os_disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = random_pet.admin_username.id
    admin_password = random_password.admin_password.result
  }

dynamic "os_profile_windows_config" {
for_each = var.os_type == "Windows" ? [1] : []
content {
provision_vm_agent = true
}
}

dynamic "os_profile_linux_config" {
for_each = var.os_type == "Linux" ? [1] : []
content {
disable_password_authentication = false
}
}

}


resource "random_password" "admin_password" {
length = 16
special = true
}

resource "random_pet" "admin_username" {
length = 2
}