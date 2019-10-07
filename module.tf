
resource "random_string" "asrrand" {
    length  = 3
    upper   = false
    special = false
    number  = false 
}

resource "azurerm_recovery_services_vault" "asr_rg_vault" {
  name                = "${var.asr_vault_name}-${random_string.asrrand.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  tags                = local.tags
}
