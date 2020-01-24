module "caf_name_asr" {
  source  = "aztfmod/caf-naming/azurerm"
  version = "~> 0.1.0"

  name    = var.name
  type    = "asr"
  convention  = var.convention
}

resource "azurerm_recovery_services_vault" "asr_rg_vault" {
  name                = module.caf_name_asr.asr
  location            = var.location
  resource_group_name = var.rg
  sku                 = "Standard"
  tags                = local.tags
}