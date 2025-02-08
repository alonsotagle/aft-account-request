terraform {
  required_version = ">= 0.15.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.15"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}
