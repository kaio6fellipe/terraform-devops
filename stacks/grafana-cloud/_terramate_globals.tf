// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

locals {
  globals = {
    environment               = "dev"
    grafana_provider          = true
    region                    = "us-east-1"
    remote_state_bucket       = "terraform-state20220711040913053000000001"
    remote_state_data_enabled = false
    remote_state_dynamodb     = "terraform-state"
    required_providers = {
      aws = {
        source  = "hashicorp/aws"
        version = "4.57.1"
      }
      grafana = {
        source  = "grafana/grafana"
        version = "1.40.1"
      }
    }
    terraform_version = [
      "1.2.4",
    ]
  }
}
