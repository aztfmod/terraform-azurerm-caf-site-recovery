module "caf_name_gen" {
  source  = "aztfmod/caf-naming/azurerm"
  version = "~> 0.1.0"

  name    = var.name
  type    = "gen"
  convention  = var.convention
}

resource "azurerm_recovery_services_vault" "asr_rg_vault" {
  name                = module.caf_name_gen.gen
  location            = var.location
  resource_group_name = var.rg
  sku                 = "Standard"
  tags                = local.tags
}

