generate_hcl "_terramate_remote-state.tf" {
  content {
    terraform {
      backend "s3" {
        bucket         = global.remote_state_bucket
        key            = "${terramate.stack.path.relative}/terraform.tfstate"
        region         = global.region
        encrypt        = true
        kms_key_id     = "alias/terraform-bucket-key"
        dynamodb_table = global.remote_state_dynamodb
      }
    }
  }
}