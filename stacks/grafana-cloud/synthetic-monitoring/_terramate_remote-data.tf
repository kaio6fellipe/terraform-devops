// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "terraform_remote_state" "Ag6VT4tTfBuSba4NUZD6rI799fqqvDbWYL70-grafana-cloud" {
  backend = "s3"
  config = {
    bucket         = "terraform-state20220711040913053000000001"
    key            = "Ag6VT4tTfBuSba4NUZD6rI799fqqvDbWYL70-grafana-cloud/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state"
  }
}
locals {
  Ag6VT4tTfBuSba4NUZD6rI799fqqvDbWYL70-grafana-cloud_outputs = data.terraform_remote_state.Ag6VT4tTfBuSba4NUZD6rI799fqqvDbWYL70-grafana-cloud.outputs
}
