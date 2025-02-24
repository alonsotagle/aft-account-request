provider "github" {
  owner = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["gh_owner"]
  token = jsondecode(data.aws_secretsmanager_secret_version.aft_secrets.secret_string)["github_token"]
}

resource "github_repository" "repo" {
  name        = var.aft_account_ref
  description = "This repository is created automatically by AWS AFT account creation from a template."

  visibility             = "private"
  allow_merge_commit     = false
  allow_squash_merge     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = true
  vulnerability_alerts   = true

  template {
    owner                = "alonsotagle"
    repository           = "template-aws-aft"
    include_all_branches = false
  }
}
