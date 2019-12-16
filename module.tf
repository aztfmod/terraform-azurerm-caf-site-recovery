module "caf_name_gen" {
  source = "../terraform-azurerm-caf-naming/"
  
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
