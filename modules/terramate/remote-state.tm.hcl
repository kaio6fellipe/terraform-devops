generate_hcl "_terramate_remote-state.tf" {
    content {
        terraform {
            backend "s3" {
                bucket         = "terraform-state20220711040913053000000001"
                key            = "${terramate.stack.path.relative}/terraform.tfstate"
                region         = "us-east-1"
                encrypt        = true
                kms_key_id     = "alias/terraform-bucket-key"
                dynamodb_table = "terraform-state"
            }
        }
    }
}
