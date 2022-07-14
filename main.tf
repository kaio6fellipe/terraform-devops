terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            configuration_aliases = [ aws.us-east-1,aws.sa-east-1 ]
        }
    }
}

module "us-east-1" {
  source = "./modules/multi-region"
  providers = {
    aws = aws.us-east-1
  }
}

module "sa-east-1" {
  source = "./modules/multi-region"
  providers = {
    aws = aws.sa-east-1
  }
}