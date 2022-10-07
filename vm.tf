resource "azurerm_network_interface" "nic_1" {
  name                = join("-", ["nic", "1", local.long_resource_name, var.location_short])
  location            = azurerm_resource_group.rg_vm.location
  resource_group_name = azurerm_resource_group.rg_vm.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.snet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip1.id
  }
}

resource "azurerm_windows_virtual_machine" "vm_1" {
  name                = join("", ["vm", local.short_resource_name])
  location            = azurerm_resource_group.rg_vm.location
  resource_group_name = azurerm_resource_group.rg_vm.name
  size                = "Standard_D4as_v5"
  admin_username      = var.admin_un
  admin_password      = data.azurerm_key_vault_secret.admin_password.value # Here we go through data objects
  network_interface_ids = [
    azurerm_network_interface.nic_1.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter"
    version   = "latest"
  }
}
