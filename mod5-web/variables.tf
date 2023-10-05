variable "base_name" {
  type        = string
  description = "Base name for the infrastructure deployment"
}

variable "location" {
  type        = string
  description = "Azure Region to deploy the infrastructure"
  default     = "West Europe"
}

variable "index_document" {
  type        = string
  description = "Name of the index document for the static website"
  default     = "index.html"
}


variable "source_content" {
  type        = string
  description = "Static website content"
  default     = "<h1>Web page created with Terraform</h1>"
}