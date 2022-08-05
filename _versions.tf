terraform {
  required_version = "1.2.4"
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.use1, aws.sae1]
      version               = "4.22.0"
    }
  }
}
