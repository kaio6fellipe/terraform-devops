globals {
  remote_state_data_enabled = true
  remote_state_datasources = [
    "vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks",      # /stacks
    "PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s" # /stacks/platform/platform-k8s
  ]
  required_providers = {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.1"
    }
  }
}
