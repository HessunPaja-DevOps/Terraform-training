# Example for another way to create dynamic strings

resource "azurerm_managed_disk" "data_disk_1" {
  name                 = "disk-1-${local.long_resource_name}-${var.location_short}"
  location             = azurerm_resource_group.rg_vm.location
  resource_group_name  = azurerm_resource_group.rg_vm.name
  storage_account_type = "StandardSSD_LRS"
  create_option        = "Empty"
  disk_size_gb         = 256
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk_attachment_1" {
  managed_disk_id    = azurerm_managed_disk.data_disk_1.id
  virtual_machine_id = azurerm_windows_virtual_machine.vm_1.id
  lun                = "10"
  caching            = "ReadWrite"
}
