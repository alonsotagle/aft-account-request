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
