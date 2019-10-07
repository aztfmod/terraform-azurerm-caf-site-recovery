#Defines protection policy for backup 
#Create as many policy files as you need based on this template
resource "azurerm_recovery_services_protection_policy_vm" "backup" {
  depends_on          = [azurerm_recovery_services_vault.asr_rg_vault]
  name                = "TFMamagedDefaultPolicyBackupRetention"
  resource_group_name = var.resource_group_name
  recovery_vault_name = "${azurerm_recovery_services_vault.asr_rg_vault.name}"

  timezone = "Singapore Standard Time"
  #Use full TZ name as per: https://docs.microsoft.com/en-us/previous-versions/windows/embedded/gg154758(v=winembedded.80)

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 10
  }

  retention_weekly {
    count    = 42
    weekdays = ["Sunday", "Wednesday", "Friday", "Saturday"]
  }

  retention_monthly {
    count    = 7
    weekdays = ["Sunday", "Wednesday"]
    weeks    = ["First", "Last"]
  }

  retention_yearly {
    count    = 3
    weekdays = ["Sunday"]
    weeks    = ["Last"]
    months   = ["January"]
  }
}