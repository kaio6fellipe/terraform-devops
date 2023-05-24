globals {
  remote_state_data_enabled = true
  remote_state_datasources = [
    "vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks",  # /stacks
    "RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y-platform" # /stacks/platform
  ]
  required_providers = {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.1"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.0"
    }
    external = {
      source  = "hashicorp/external"
      version = "2.3.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.20.0"
    }
  }
}
