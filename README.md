[![Build status](https://dev.azure.com/azure-terraform/Blueprints/_apis/build/status/modules/site_recovery)](https://dev.azure.com/azure-terraform/Blueprints/_build/latest?definitionId=9)
# Deploys an Azure Site Recovery Vault
Creates the Azure Site Recovery Vault in a given region


Reference the module to a specific version (recommended):
```hcl
module "site_recovery" {
    source  = "aztfmod/caf-site-recovery/azurerm"
    version = "0.x.y"
    
    rg                                = var.rg
    name                              = var.name
    location                          = var.location
    tags                              = var.tags
    opslogs_retention_period          = var.retention
    diagnostics_map                   = var.diagsmap
    la_workspace_id                   = var.laworkspace.id
}
```
## Inputs

| Name | Type | Default | Description | 
| -- | -- | -- | -- | 
| rg | string | None | Name of the resource group where to create the resource. Changing this forces a new resource to be created. |
| location | string | None | Specifies the Azure location to deploy the resource. Changing this forces a new resource to be created.  | 
| name | string | None | Name of the resource to be created. Changing this forces a new resource to be created. | 
| tags | map | None | Map of tags for the deployment.  | 
| la_workspace_id | string | None | Log Analytics Workspace ID. | 
| diagnostics_map | map | None | Map with the diagnostics repository information.  | 
| diagnostics_settings | object | None | Map with the diagnostics settings. See the required structure in the following example or in the diagnostics module documentation. | 
| convention | string | None | Naming convention to be used (check at the naming convention module for possible values).  | 


## Output

| Name | Type | Description | 
| -- | -- | -- | 
| object | object | Returns the full object of the created ASR. |
| name | string | Returns the name of the created ASR. |
| id | string | Returns the ID of the created ASR. | 
