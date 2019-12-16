module "diagnostics_asr" {
  # source  = "aztfmod/caf-diagnostics/azurerm"
  # version = "0.1.1"
  source = "git://github.com/aztfmod/terraform-azurerm-caf-diagnostics.git?ref=1912-Refresh"
  
    name                            = azurerm_recovery_services_vault.asr_rg_vault.name
    resource_id                     = azurerm_recovery_services_vault.asr_rg_vault.id
    log_analytics_workspace_id      = var.la_workspace_id
    diagnostics_map                 = var.diagnostics_map
    diag_object                     = var.diagnostics_settings
}