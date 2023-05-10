generate_hcl "_terramate_versions.tf" {
    content {
        terraform {
            required_version = global.terraform_version
            required_providers {
                aws = {
                source  = "hashicorp/aws"
                version = global.hashcorp_aws_version
                }
            }
        }
    }
}
