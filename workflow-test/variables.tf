variable "base_name" {
  type        = string
  description = "Base name for the infrastructure deployment"
  default     = "afmwftest"
}

variable "location" {
  type        = string
  description = "Azure Region to deploy the infrastructure"
  default     = "West Europe"
}