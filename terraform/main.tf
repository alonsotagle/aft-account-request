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

module "sandbox_account_01" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail = "alonsotaglecom+awssandbox1@gmail.com"
    AccountName  = "sandbox-account-01"
    # Syntax for top-level OU
    # ManagedOrganizationalUnit = "Sandbox"
    # Syntax for nested OU
    ManagedOrganizationalUnit = "Sandbox (ou-2e4r-ppyjdknc)"
    SSOUserEmail     = "alonsotaglecom+awssandbox1@gmail.com"
    SSOUserFirstName = "John"
    SSOUserLastName  = "Doe"
  }

  account_tags = {
    "ABC:Owner"       = "john.doe@amazon.com"
    "ABC:Division"    = "ENT"
    "ABC:Environment" = "Dev"
    "ABC:CostCenter"  = "123456"
    "ABC:Vended"      = "true"
    "ABC:DivCode"     = "102"
    "ABC:BUCode"      = "ABC003"
    "ABC:Project"     = "123456"
  }

  change_management_parameters = {
    change_requested_by = "John Doe"
    change_reason       = "testing the account vending process"
  }

  custom_fields = {
    custom1 = "a"
    custom2 = "b"
  }

  account_customizations_name = "sandbox-customizations"
}
