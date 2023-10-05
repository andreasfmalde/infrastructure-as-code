locals {
  workspace_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
  base             = "${var.base_name}${local.workspace_suffix}"
}