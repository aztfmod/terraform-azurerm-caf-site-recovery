data "azurerm_client_config" "current" {
}

module "rg_test" {
  source  = "aztfmod/caf-resource-group/azurerm"
  version = "0.1.1"
  
    prefix          = local.prefix
    resource_groups = local.resource_groups
    tags            = local.tags
}

module "la_test" {
  source  = "aztfmod/caf-log-analytics/azurerm"
  version = "0.1.0"
  
    # convention          = local.convention
    location            = local.location
    name                = local.name
    solution_plan_map   = local.solution_plan_map 
    prefix              = local.prefix
    resource_group_name = module.rg_test.names.test
    tags                = local.tags
}

module "diags_asr_test" {
  source  = "aztfmod/caf-diagnostics-logging/azurerm"
  version = "0.1.2"

  resource_group_name   = module.rg_test.names.test
  prefix                = local.prefix
  location              = local.location
  tags                  = local.tags
}

module "asr_test" {
  source = "../../"
  
  convention               = local.convention
  name                     = local.asr_vault_name
  rg                       = module.rg_test.names.test
  location                 = local.location 
  tags                     = local.tags
  la_workspace_id          = module.la_test.id
  diagnostics_map          = module.diags_asr_test.diagnostics_map
  diagnostics_settings     = local.asr_diags
}
