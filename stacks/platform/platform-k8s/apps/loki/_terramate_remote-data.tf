// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "terraform_remote_state" "stacks_platform_platform-k8s" {
  backend = "s3"
  config = {
    bucket         = "terraform-state20220711040913053000000001"
    key            = "stacks/platform/platform-k8s/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state"
  }
}
locals {
  stacks_platform_platform-k8s_outputs = data.terraform_remote_state.stacks_platform_platform-k8s.outputs
}
