resource "azurecaf_naming_convention" "caf_name_asr" {  
  name          = var.name
  prefix        = var.prefix != "" ? var.prefix : null
  postfix       = var.postfix != "" ? var.postfix : null
  max_length    = var.max_length != "" ? var.max_length : null
  resource_type = "asr"
  convention    = var.convention
}

resource "azurerm_recovery_services_vault" "asr_rg_vault" {
  name                = azurecaf_naming_convention.caf_name_asr.result
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  tags                = local.tags

  soft_delete_enabled = var.soft_delete_enabled
}