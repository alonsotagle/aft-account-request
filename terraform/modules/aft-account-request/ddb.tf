locals {
  custom_fields = merge({
    "aft-account-ref"   = var.aft_account_ref,
    "github-repo"       = github_repository.repo.full_name,
    "tfe-token"         = lookup(var.tfe_parameters, "tfe_token"),
    "tfe-organization"  = lookup(var.tfe_parameters, "tfe_organization"),
    "tfe-project-id"    = lookup(var.tfe_parameters, "tfe_project_id"),
    "tfe-github-app-id" = lookup(var.tfe_parameters, "tfe_github_app_id"),
  }, var.custom_fields)
}

resource "aws_dynamodb_table_item" "account-request" {
  table_name = var.account-request-table
  hash_key   = var.account-request-table-hash

  item = jsonencode({
    id = { S = lookup(var.control_tower_parameters, "AccountEmail") }
    control_tower_parameters = { M = {
      AccountEmail              = { S = lookup(var.control_tower_parameters, "AccountEmail") }
      AccountName               = { S = lookup(var.control_tower_parameters, "AccountName") }
      ManagedOrganizationalUnit = { S = lookup(var.control_tower_parameters, "ManagedOrganizationalUnit") }
      SSOUserEmail              = { S = lookup(var.control_tower_parameters, "SSOUserEmail") }
      SSOUserFirstName          = { S = lookup(var.control_tower_parameters, "SSOUserFirstName") }
      SSOUserLastName           = { S = lookup(var.control_tower_parameters, "SSOUserLastName") }
      }
    }
    change_management_parameters = { M = {
      change_reason       = { S = lookup(var.change_management_parameters, "change_reason") }
      change_requested_by = { S = lookup(var.change_management_parameters, "change_requested_by") }
      }
    }
    account_tags                = { S = jsonencode(var.account_tags) }
    account_customizations_name = { S = var.account_customizations_name }
    custom_fields               = { S = jsonencode(local.custom_fields) }
  })
}
