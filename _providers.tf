terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            configuration_aliases = [ aws.use1, aws.sae1 ]
        }
    }
}

provider "aws" {
    alias   = "use1"
    region  = "us-east-1" 

    default_tags {
        tags = {
            ManagedBy = "Terraform"
        }
    }
}

provider "aws" {
    alias   = "sae1"
    region  = "sa-east-1"

    default_tags {
        tags = {
            ManagedBy = "Terraform"
        }
    }
}