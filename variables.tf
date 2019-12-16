variable "rg" {
  description = "(Required) Resource group name"
}

variable "location" {
  description = "(Required) Location of the site recovery vault."
}

variable "name" {
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

variable "convention" {
  description = "(Required) Naming convention method to use"  
}

