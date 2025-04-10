variable "account-request-table" {
  type        = string
  description = "name of account-request-table"
  default     = "aft-request"
}

variable "account-request-table-hash" {
  type        = string
  description = "name of account-request-table hash key"
  default     = "id"
}

variable "control_tower_parameters" {
  type = object({
    AccountEmail              = string
    AccountName               = string
    ManagedOrganizationalUnit = string
    SSOUserEmail              = string
    SSOUserFirstName          = string
    SSOUserLastName           = string
  })
}

variable "change_management_parameters" {
  type = object({
    change_requested_by = string
    change_reason       = string
  })
}

variable "account_tags" {
  type        = map(any)
  description = "map of account-level tags"
}

variable "custom_fields" {
  type        = map(any)
  description = "map of custom fields defined by the customer"
  default     = {}
}

variable "account_customizations_name" {
  type        = string
  default     = null
  description = "The name of the account customizations to apply"
}

variable "aft_account_ref" {
  type        = string
  description = "Name of the Github repo and Terraform Workspace"
}

variable "tfe_parameters" {
  type = object({
    tfe_token         = string
    tfe_organization  = string
    tfe_project_id    = string
    tfe_github_app_id = string
  })
}
