resource "azurerm_network_security_group" "nsg1" {
  name                = join("", ["nsg", "1", local.short_resource_name, var.location_short])
  location            = azurerm_resource_group.rg_network.location
  resource_group_name = azurerm_resource_group.rg_network.name
}

resource "azurerm_network_security_rule" "rule1" {
  name                        = "AllowRDPfromMyIp"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "" # Put ident.me output here
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg_network.name
  network_security_group_name = azurerm_network_security_group.nsg1.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_association_1" {
  subnet_id                 = azurerm_subnet.snet1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}
