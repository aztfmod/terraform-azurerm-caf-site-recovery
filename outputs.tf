##export the ASR repo info
output "id" {
  value = azurerm_recovery_services_vault.asr_rg_vault.id
}

output "name" {
  value = azurerm_recovery_services_vault.asr_rg_vault.name
}

output "object" {
  value = azurerm_recovery_services_vault.asr_rg_vault
}