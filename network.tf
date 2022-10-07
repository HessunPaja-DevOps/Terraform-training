resource "azurerm_virtual_network" "vnet1" {
  name                = join("-", ["vnet", "1", local.long_resource_name, var.location_short])
  location            = azurerm_resource_group.rg_network.location
  resource_group_name = azurerm_resource_group.rg_network.name
  address_space       = ["10.153.27.0/24"] # Lets change this to variable
}

resource "azurerm_subnet" "snet1" {
  name                 = join("-", ["snet", "1", local.long_resource_name, var.location_short])
  resource_group_name  = azurerm_resource_group.rg_network.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.153.27.0/26"]
}
