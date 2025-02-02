locals {
  account_comms = "Comms (ou-2e4r-45ykgo1b)"
}

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

module "comms_email" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "alonsotaglecom+email@gmail.com"
    AccountName               = "email"
    ManagedOrganizationalUnit = local.account_comms
    SSOUserEmail              = "alonsotaglecom+email@gmail.com"
    SSOUserFirstName          = "Alonso"
    SSOUserLastName           = "Tagle"
  }

  account_tags = {
    "ManagedBy" = "Terraform - AFT"
  }

  change_management_parameters = {
    change_requested_by = "Alonso Tagle"
    change_reason       = "Creating Comms/email account"
  }

  custom_fields = {
    group = "comms"
  }

  account_customizations_name = "comms"
}
