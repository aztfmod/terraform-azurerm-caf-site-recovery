[![Build status](https://dev.azure.com/azure-terraform/Blueprints/_apis/build/status/modules/site_recovery)](https://dev.azure.com/azure-terraform/Blueprints/_build/latest?definitionId=9)
# Deploys an Azure Site Recovery Vault
Creates the Azure Site Recovery Vault in a given region


Reference the module to a specific version (recommended):
```hcl
module "site_recovery" {
    source  = "aztfmod/caf-site-recovery/azurerm"
    version = "0.x.y"
    
    resource_group_name               = var.rg
    asr_vault_name                    = var.name
    location                          = var.location
    tags                              = var.tags
    opslogs_retention_period          = var.retention
    diagnostics_map                   = var.diagsmap
    la_workspace_id                   = var.laworkspace.id
}
```

# Parameters
## asr_vault_name
(Required) name of the ASR vault
```hcl
variable "asr_vault_name" {
  description = "name of the ASR vault"
}

```
Example
```hcl
asr_vault_name = "myvault"
```

## resource_group_name
(Required) (Required) Name of the resource group to deploy the ASR vault.
```hcl
variable "resource_group_name" {
  description = "(Required) Name of the resource group to deploy the ASR vault."
}

```
Example
```hcl
resource_group_name = "operations-rg"
```

## location
(Required) Define the region where the ASR vault will be created.
```hcl

variable "location" {
  description = "(Required) Define the region where the ASR vault will be created"
  type        = string
}
```
Example
```hcl
    location    = "southeastasia"
```

## tags
(Required) Map of tags for the deployment
```hcl
variable "tags" {
  description = "(Required) map of tags for the deployment"
}
```
Example
```hcl
tags = {
    environment     = "DEV"
    owner           = "Arnaud"
    deploymentType  = "Terraform"
  }
```

## la_workspace_id
(Required) Log Analytics Repository ID
```hcl
variable "la_workspace_id" {
  description = "Log Analytics Repository"
}
```
Example
```hcl
la_workspace_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/arnaud-hub-operations/providers/microsoft.operationalinsights/workspaces/mylalogs"
```

## diagnostics_map
(Required) Map with the diagnostics repository information"
```hcl
variable "diagnostics_map" {
 description = "(Required) Map with the diagnostics repository information"
}
```
Example
```hcl
  diagnostics_map = {
      diags_sa      = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/arnaud-hub-operations/providers/Microsoft.Storage/storageAccounts/opslogskumowxv"
      eh_id         = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/arnaud-hub-operations/providers/Microsoft.EventHub/namespaces/opslogskumowxv"
      eh_name       = "opslogskumowxv"
  }
```

## diagnostics_settings
(Required) Map with the diagnostics settings for ASR deployment.
See the required structure in the following example or in the diagnostics module documentation.

```hcl
variable "diagnostics_settings" {
 description = "(Required) Map with the diagnostics settings for ASR deployment"
}
```
Example
```hcl
  diagnostics_settings = {
    log = [
                #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
                ["AzureBackupReport", true, true, 40],
                ["AzureSiteRecoveryJobs", true, true, 20],
                ["AzureSiteRecoveryEvents", true, true, 30],
                ["AzureSiteRecoveryReplicatedItems", true, true, 40],
                ["AzureSiteRecoveryReplicationStats", true, true, 50],
                ["AzureSiteRecoveryRecoveryPoints", true, true, 60],
                ["AzureSiteRecoveryReplicationDataUploadRate", true, true, 70],
                ["AzureSiteRecoveryProtectedDiskDataChurn", true, true, 80],
        ]
    metric = [
               #["AllMetrics", 60, True],
    ]
}
```

# Output

| Name | Type | Description | 
| -- | -- | -- | 
| object | object | Returns the full object of the created ASR. |
| name | string | Returns the name of the created ASR. |
| id | string | Returns the ID of the created ASR. | 
