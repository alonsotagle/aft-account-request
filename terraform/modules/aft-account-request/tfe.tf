provider "tfe" {
  token        = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["tfe_token"]
  organization = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["tfe_organization"]
}

resource "tfe_workspace" "aft_workspace" {
  name              = var.aft_account_ref
  description       = "This workspace is created automatically by AWS AFT account creation."
  auto_apply        = false
  working_directory = "terraform"
  tag_names         = ["managedby-aft"]
  project_id        = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["tfe_project_id"]

  vcs_repo {
    branch                     = "main"
    identifier                 = github_repository.repo.full_name
    github_app_installation_id = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["tfe_github_app_id"]
  }
}

resource "tfe_workspace_settings" "aft_workspace_settings" {
  workspace_id   = tfe_workspace.aft_workspace.id
  execution_mode = "remote"
}

resource "tfe_variable" "tfc_aws_provider_auth" {
  key          = "TFC_AWS_PROVIDER_AUTH"
  value        = "true"
  category     = "env"
  workspace_id = tfe_workspace.aft_workspace.id
}

resource "tfe_variable" "tfc_example_role_arn" {
  sensitive    = true
  key          = "TFC_AWS_RUN_ROLE_ARN"
  value        = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/tfe-aws"
  category     = "env"
  workspace_id = tfe_workspace.aft_workspace.id
}
