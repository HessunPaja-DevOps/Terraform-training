resource "azurerm_public_ip" "pip1" {
  name                = join("-", ["pip", "1", local.long_resource_name, var.location_short])
  location            = azurerm_resource_group.rg_vm.location
  resource_group_name = azurerm_resource_group.rg_vm.name
  allocation_method   = "Static"
}

# This is not included in subnet address space -> NSG association needed for RDP
