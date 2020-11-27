# **READ ME**

Thanks for your interest in Cloud Adoption Framework for Azure landing zones on Terraform.
This module is now deprecated and no longer maintained. 

As part of Cloud Adoption Framework landing zones for Terraform, we have migrated to a single module model, which you can find here: https://github.com/aztfmod/terraform-azurerm-caf and on the Terraform registry: https://registry.terraform.io/modules/aztfmod/caf/azurerm 

In Terraform 0.13 you can now call directly submodules easily with the following syntax:
```hcl
module "caf_recovery_vault" {
  source  = "aztfmod/caf/azurerm//modules/recovery_vault"
  version = "0.4.18"
  # insert the 6 required variables here
}
```




[![Gitter](https://badges.gitter.im/aztfmod/community.svg)](https://gitter.im/aztfmod/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

# Deploys an Azure Site Recovery Vault
Creates the Azure Site Recovery Vault in a given region


Reference the module to a specific version (recommended):
```hcl
module "site_recovery" {
    source  = "aztfmod/caf-site-recovery/azurerm"
    version = "0.x.y"
    
    resource_group_name               = var.rg
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
| resource_group_name | string | None | (Required) Name of the resource group where to create the resource. Changing this forces a new resource to be created. |
| location | string | None | (Required) Specifies the Azure location to deploy the resource. Changing this forces a new resource to be created.  | 
| name | string | None | (Required) Name of the resource to be created. Changing this forces a new resource to be created. | 
| tags | map | None | (Required) Map of tags for the deployment.  | 
| soft_delete_enabled | bool | true | (Optional) Enable soft delete enable for this Vault  | 
| la_workspace_id | string | None | (Required) Log Analytics Workspace ID. | 
| diagnostics_map | map | None | (Required) Map with the diagnostics repository information.  | 
| diagnostics_settings | object | None | (Required) Map with the diagnostics settings. See the required structure in the following example or in the diagnostics module documentation. | 
| convention | string | None | (Required) Naming convention to be used (check at the naming convention module for possible values).  | 
| prefix | string | None | (Optional) Prefix to be used. |
| postfix | string | None | (Optional) Postfix to be used. |
| max_length | string | None | (Optional) maximum length to the name of the resource. |



## Output

| Name | Type | Description | 
| -- | -- | -- | 
| object | object | Returns the full object of the created ASR. |
| name | string | Returns the name of the created ASR. |
| id | string | Returns the ID of the created ASR. | 
