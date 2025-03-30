locals {
  ou_comms   = "Comms (ou-2e4r-45ykgo1b)"
  ou_finance = "Finance (ou-2e4r-vvvnvvei)"
}

module "comms_email" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "alonsotaglecom+email@gmail.com"
    AccountName               = "email"
    ManagedOrganizationalUnit = local.ou_comms
    SSOUserEmail              = "alonsotaglecom+email@gmail.com"
    SSOUserFirstName          = "Alonso"
    SSOUserLastName           = "Tagle"
  }

  tfe_parameters = {
    tfe_token = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["tfe_token"]
    tfe_organization = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["tfe_organization"]
    tfe_project_id = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["tfe_project_id"]
    tfe_github_app_id = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["tfe_github_app_id"]
  }

  aft_account_ref = "aft-comms-email" # Name of the Github repo and Terraform Workspace

  account_tags = {
    "ManagedBy" = "Terraform - AFT"
  }

  change_management_parameters = {
    change_requested_by = "Alonso Tagle"
    change_reason       = "Creating Comms/email account"
  }

  custom_fields = {
  }

  account_customizations_name = "comms"
}

module "comms_maia" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "alonsotaglecom+maia@gmail.com"
    AccountName               = "maia"
    ManagedOrganizationalUnit = local.ou_comms
    SSOUserEmail              = "alonsotaglecom+maia@gmail.com"
    SSOUserFirstName          = "Alonso"
    SSOUserLastName           = "Tagle"
  }

  tfe_parameters = {
    tfe_token = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["tfe_token"]
    tfe_organization = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["tfe_organization"]
    tfe_project_id = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["tfe_project_id"]
    tfe_github_app_id = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["tfe_github_app_id"]
  }

  aft_account_ref = "aft-comms-maia" # Name of the Github repo and Terraform Workspace

  account_tags = {
    "ManagedBy" = "Terraform - AFT"
  }

  change_management_parameters = {
    change_requested_by = "Alonso Tagle"
    change_reason       = "Creating Comms/maia account"
  }

  custom_fields = {
  }

  account_customizations_name = "comms"
}

# module "finance_expenses" {
#   source = "./modules/aft-account-request"

#   control_tower_parameters = {
#     AccountEmail              = "alonsotaglecom+expenses@gmail.com"
#     AccountName               = "finance-expenses"
#     ManagedOrganizationalUnit = local.ou_finance
#     SSOUserEmail              = "alonsotaglecom+expenses@gmail.com"
#     SSOUserFirstName          = "Alonso"
#     SSOUserLastName           = "Tagle"
#   }

#   tfe_parameters = {
#     tfe_token = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["tfe_token"]
#     tfe_organization = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["tfe_organization"]
#     tfe_project_id = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["tfe_project_id"]
#     tfe_github_app_id = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["tfe_github_app_id"]
#   }

#   aft_account_ref = "aft-finance-expenses" # Name of the Github repo and Terraform Workspace

#   account_tags = {
#     "ManagedBy" = "Terraform - AFT"
#   }

#   change_management_parameters = {
#     change_requested_by = "Alonso Tagle"
#     change_reason       = "Creating Finance/expenses account"
#   }

#   custom_fields = {
#   }

#   account_customizations_name = "finance"
# }
