
output "vm_id" {
  description = "The ID of the Virtual Machine"
  value       = azurerm_virtual_machine.this.id
}

output "vm_name" {
  description = "The name of the Virtual Machine"
  value       = azurerm_virtual_machine.this.name
}

output "private_ip" {
  description = "The public IP address of the Virtual Machine"
  value       = azurerm_network_interface.this.private_ip_address
}

output "admin_username" {
      value = random_pet.admin_username.id
      sensitive = true
}
output "admin_password" {
  value =   random_password.admin_password.result
  sensitive = true
  
}