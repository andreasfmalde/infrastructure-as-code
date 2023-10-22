variable "base_name" {
    type = string
    description = "Base name of the entire infrastructure setup"
    default = "afmoppg1"
}

variable "location" {
  type        = string
  description = "Location of the resource"
  default = "West Europe"
}


variable "nic_ip_configuration_name" {
  type        = string
  description = "IP configuration name"
  default = "internal"
}

variable "nic_ip_configuration_private_IP" {
  type        = string
  description = "IP configuration private IP address allocation"
  default = "Dynamic"
}

variable "VM_size" {
  type        = string
  description = "VM size"
  default = "Standard_F2"
}

variable "OS_caching" {
  type        = string
  description = "OS caching"
  default = "ReadWrite"
}

variable "OS_StorageAccount_type" {
  type        = string
  description = "OS Storrage Account Type"
  default = "Standard_LRS"
}

variable "source_image_sku" {
  type        = string
  description = "Source Image SKU"
  default = "20_04-lts"

}
variable "keyvalt_SKU" {
    type = string
    description = "SKU name of key vault"
    default = "standard"
}

variable "key_permissions" {
    type = list(string)
    description = "List of key permissions for key vault"
    default = ["Create","Get","Delete","List","Update"]
}

variable "secret_permissions" {
    type = list(string)
    description = "List of secret permissions for key vault"
    default = ["Get","List","Delete","Set","Purge","Delete"]
}

variable "storage_permissions" {
    type = list(string)
    description = "List of storage permissions for key vault"
    default = ["Get","List","Delete","Purge"] 
}

variable "kv_secret_login_name" {
    type = string
    description = "Name of the secret holding login credentials to the VM"
    default = "VMLogin"
}

variable "kv_secret_login_username"{
    type = string
    description = "Login username of VM"
}
variable "kv_secret_login_password"{
    type = string
    description = "Login username of VM"
}

variable "kv_secret_sa_access_name" {
    type = string
    description = "Name of the secret holding storage account access link"
    default = "SAAccess"
}
variable "sa-account-tier" {
    type = string
    description = "Storage Account Tier"
    default = "Standard"
}

variable "sa-account-replication-type" {
    type = string
    description = "Storage account replication type"
    default = "LRS"
}

variable "sa-container-access-type" {
    type = string
    description = "Storage Container access type"
    default = "private"
}

variable "addr_space" {
    type = list(string)
    description = "List of address spaces in vnet"
    default = ["10.0.0.0/16"]
}

variable "dns-server" {
    type = list(string)
    description = "List of DNS server IPs"
    default = ["10.0.0.4","10.0.0.5"]
}


variable "subnet-prefixes" {
    type = list(string)
    description = "List of subnet prefixes"
    default = ["10.0.1.0/24"]
}
variable "security_rule_direction" {
    type = string
    description = "Security rule direction"
    default = "Inbound"
}

variable "security_rule_access" {
    type = string
    description = "Security rule access"
    default = "Allow"
}

variable "security_rule_protocol" {
    type = string
    description = "Security rule protocol"
    default = "Tcp"
}

variable "security_rule_source_port" {
    type = string
    description = "Security rule source port range"
    default = "*"
}

variable "security_rule_dest_port" {
    type = string
    description = "Security rule destination port range"
}

variable "security_rule_source_address" {
    type = string
    description = "Security rule source address prefix"
}

variable "security_rule_dest_address" {
    type = string
    description = "Security rule destination address prefix"
    default = "*"
}