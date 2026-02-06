# Learn Terraform - Use Control Tower Account Factory for Terraform

This is a companion repository for the Hashicorp [Provision and Manage Accounts with
Control Tower Account Factory for Terraform
tutorial](https://developer.hashicorp.com/terraform/tutorials/aws/aws-control-tower-aft).

This repository contains boilerplate configuration for defining account
requests to use with the Account Factory for Terraform module. The AFT pipeline
requires the structure used and the included submodule to define a DynamoDB
table item with your account specifications. 


## Create a new account

1. Create a new account by adding a new module block in the `terraform/main.tf` file.

Example:
```hcl
module "finance_expenses" {
  source = "./modules/aft-account-request"
}
```

1. Enter the AFT AWS Account (911167915310) login with `alonsotaglecom+aft@gmail.com` email

1. Release changes from the `ct-aft-account-request`
pipeline [AWS Console](https://us-east-1.console.aws.amazon.com/codesuite/codepipeline/pipelines)

1. New pipeline execution will insert a dynamo item and create the new github repository

1. Enable the schedule rule `aft-lambda-account-request-processor` to process the new account request [AWS Console](https://us-east-1.console.aws.amazon.com/events/home?region=us-east-1#/scheduled-rule/aft-lambda-account-request-processor)

Review policies from `tfe-aws` role in the new account.

### Troubleshooting

- Check the github connection is enabled in the AFT account under the
`ct-aft-github-connection` CodePipeline.

If not activate it and re-release the pipeline.

[AWS Console](https://us-east-1.console.aws.amazon.com/codesuite/settings/911167915310/us-east-1/codeconnections/connections/31126861-6f93-4d7c-84c4-880796615823?region=us-east-1&tags-meta=eyJmIjp7fSwicyI6e30sIm4iOjIwLCJpIjowfQ)

- Ensure OU is enable to create accounts in Control Tower settings.

[AWS Console](https://us-east-1.console.aws.amazon.com/controltower/home/organization?region=us-east-1)

- Check service catalog passed successfully in the root account (168997536912).

[AWS Console](https://us-east-1.console.aws.amazon.com/servicecatalog/home?region=us-east-1#provisioned-products)
