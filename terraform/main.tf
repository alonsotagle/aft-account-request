module "email" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "alonsotaglecom+awsemail@gmail.com"
    AccountName               = "Email"
    ManagedOrganizationalUnit = "Comms"
    SSOUserEmail              = "alonsotaglecom+awsemail@gmail.com"
    SSOUserFirstName          = "Alonso"
    SSOUserLastName           = "Tagle"
  }

  account_tags = {
    "ManagedBy" = "Terraform - AFT"
  }

  change_management_parameters = {
    change_requested_by = "Alonso Tagle"
    change_reason       = "Creating Email account"
  }

  custom_fields = {
    group = "non-prod"
  }

  account_customizations_name = "comms"
}

module "sandbox" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "alonsotaglecom+awssandbox@gmail.com"
    AccountName               = "sandbox-aft"
    ManagedOrganizationalUnit = "AFT"
    SSOUserEmail              = "alonsotaglecom+awssandbox@gmail.com"
    SSOUserFirstName          = "Sandbox"
    SSOUserLastName           = "AFT"
  }

  account_tags = {
    "Learn Tutorial" = "AFT"
  }

  change_management_parameters = {
    change_requested_by = "HashiCorp Learn"
    change_reason       = "Learn AWS Control Tower Account Factory for Terraform"
  }

  custom_fields = {
    group = "non-prod"
  }

  account_customizations_name = "sandbox"
}
