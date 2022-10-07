# Key vault has been created beforehand
data "azurerm_key_vault" "pre_built_kv" {
  # Name of keyvault and rg where secret is located, bring from vars
  name                = ""
  resource_group_name = ""
}

# Salaisuus haetaan data-objektina, joten siihen voidaan viitata myöhemmin
data "azurerm_key_vault_secret" "admin_password" {
  name         = "" # Name of secret for admin password, bring from vars
  key_vault_id = data.azurerm_key_vault.pre_built_kv.id
}
