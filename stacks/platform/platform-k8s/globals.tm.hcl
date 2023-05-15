globals {
  remote_state_data_enabled = true
  remote_state_datasources = [
    "stacks",
    "stacks/platform"
  ]
  required_providers = {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.7"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
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
