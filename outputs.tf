output "long_name" {
  value = local.long_resource_name
}

output "rg_name_network" {
  value = join("-", ["rg", local.long_resource_name, "network", var.location_short])
}

# Example for another way to create dynamic strings
output "rg_name_vm" {
  value = "rg-${local.long_resource_name}-vm-${var.location_short}"
}
