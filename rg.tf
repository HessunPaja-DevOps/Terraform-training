resource "azurerm_resource_group" "rg_network" {
  name     = join("-", ["rg", local.long_resource_name, "network", var.location_short])
  location = var.location_long
}

# Example for another way to create dynamic strings
resource "azurerm_resource_group" "rg_vm" {
  name     = "rg-${local.long_resource_name}-vm-${var.location_short}"
  location = var.location_long
}
