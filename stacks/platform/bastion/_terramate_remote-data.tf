// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "terraform_remote_state" "vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks" {
  backend = "s3"
  config = {
    bucket         = "terraform-state20220711040913053000000001"
    key            = "vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state"
  }
}
data "terraform_remote_state" "RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y-platform" {
  backend = "s3"
  config = {
    bucket         = "terraform-state20220711040913053000000001"
    key            = "RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y-platform/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state"
  }
}
locals {
  vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks_outputs = data.terraform_remote_state.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks.outputs
}
locals {
  RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y-platform_outputs = data.terraform_remote_state.RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y-platform.outputs
}
