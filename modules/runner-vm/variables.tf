variable "location" {
  description = "The Azure region where the VM will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the VM"
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
}

variable "vnet_resource_group_name" {
  description = "The name of the resource group containing the Virtual Network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet within the Virtual Network"
  type        = string
}

variable "vm_name" {
  description = "The name of the Virtual Machine"
  type        = string
}

variable "vm_size" {
  description = "The size of the Virtual Machine"
  type        = string
}

variable "image_name" {
  description = "The name of the Packer image"
  type        = string
}

variable "image_resource_group_name" {
  description = "The name of the resource group containing the Packer image"
  type        = string
}

variable "gallery_name" {
  type = string
}
variable "os_type" {
    type = string
  
}