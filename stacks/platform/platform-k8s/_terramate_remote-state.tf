// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket         = "terraform-state20220711040913053000000001"
    dynamodb_table = "terraform-state"
    encrypt        = true
    key            = "PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s/terraform.tfstate"
    kms_key_id     = "alias/terraform-bucket-key"
    region         = "us-east-1"
  }
}
