provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Env       = local.environment
      ManagedBy = "Terraform"
    }
  }
}