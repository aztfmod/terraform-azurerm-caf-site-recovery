variable "resource_group_name" {
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

variable "prefix" {
  description = "(Optional) You can use a prefix to the name of the resource"
  type        = string
  default = ""
}

variable "postfix" {
  description = "(Optional) You can use a postfix to the name of the resource"
  type        = string
  default = ""
}

variable "max_length" {
  description = "(Optional) You can speficy a maximum length to the name of the resource"
  type        = string
  default = ""
}

variable "soft_delete_enabled" {
  description = "(Optional) Enable soft delete enable for this Vault"
  type        = bool
  default = true
}

