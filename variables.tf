variable "resource_group_name" {
  description = "(Required) Resource group name"
}

variable "location" {
  description = "(Required) Location of the site recovery vault."
}

variable "asr_vault_name" {
  description = "(Required) name of the ASR vault"
}

variable "tags" {
  description = "(Required) tags to be applied to ASR vault"
}

variable "la_workspace_id" {
  description = "(Required) Log Analytics Repository"
}

variable "diagnostics_map" {
 description = "(Required) Map with the diagnostics repository information"
}

variable "diagnostics_settings" {
 description = "(Required) Map with the diagnostics settings for ASR deployment"
}
