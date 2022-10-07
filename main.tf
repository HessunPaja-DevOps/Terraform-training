# Tässä alustetaan Terraform
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.25.0"
    }
    # First number: Major = breaking changes
    # Second number: Minor = feature updates
    # Third number: Patch = patch, bug fixes
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

locals {
  long_resource_name  = join("-", [var.org, var.env, var.sub, var.my_name])
  short_resource_name = join("", [var.org, "sbox", var.my_name])
}
