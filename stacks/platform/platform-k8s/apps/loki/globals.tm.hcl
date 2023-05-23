globals {
  remote_state_data_enabled = true
  remote_state_datasources = [
    "stacks/platform/platform-k8s"
  ]
  required_providers = {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.1"
    }
  }
}
