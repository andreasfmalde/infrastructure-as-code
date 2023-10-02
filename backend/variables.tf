variable "base_name" {
    type = string
    description = "The name of the resource group"
}

variable "location" {
    type = string
    description = "The location of the resource group and resources"
}

variable "storage_container_name" {
    type = string
    description = "The name of the storage container"
    default = "tfstate"
}

variable "key_vault_secrect_name" {
    type = string
    description = "The name of the key vault secret"
  
}