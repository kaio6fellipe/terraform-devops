// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket         = "terraform-state20220711040913053000000001"
    dynamodb_table = "terraform-state"
    encrypt        = true
    key            = "g94WrepXSjgd7QrbwuO2fzGLSvb3NGFYXdmh-synthetic-monitoring/terraform.tfstate"
    kms_key_id     = "alias/terraform-bucket-key"
    region         = "us-east-1"
  }
}
