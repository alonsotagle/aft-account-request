# Learn Terraform - Use Control Tower Account Factory for Terraform

This is a companion repository for the Hashicorp [Provision and Manage Accounts with
Control Tower Account Factory for Terraform
tutorial](https://developer.hashicorp.com/terraform/tutorials/aws/aws-control-tower-aft).

This repository contains boilerplate configuration for defining account
requests to use with the Account Factory for Terraform module. The AFT pipeline
requires the structure used and the included submodule to define a DynamoDB
table item with your account specifications. 


## Create a new account

Create a new account by adding a new module in the `terraform/main.tf` file.

Example:
```hcl
module "finance_expenses" {
  source = "./modules/aft-account-request"
}
```

From the AFT AWS Account, release changes from the `ct-aft-account-request`
pipeline.

Review policies from `tfe-aws` role in the new account.
