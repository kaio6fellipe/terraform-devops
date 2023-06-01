// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "terraform_remote_state" "vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-aws" {
  backend = "s3"
  config = {
    bucket         = "terraform-state20220711040913053000000001"
    key            = "vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-aws/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state"
  }
}
data "terraform_remote_state" "PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s" {
  backend = "s3"
  config = {
    bucket         = "terraform-state20220711040913053000000001"
    key            = "PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state"
  }
}
locals {
  vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-aws_outputs = data.terraform_remote_state.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-aws.outputs
}
locals {
  PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s_outputs = data.terraform_remote_state.PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s.outputs
}
