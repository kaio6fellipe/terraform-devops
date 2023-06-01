// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Env            = "dev"
      Stack          = "grafana-cloud"
      StackID        = "1g6VT4tTfBuSba4NUZD6rI799fqqvDbWYL70"
      ManagedBy      = "Terraform"
      OrchestratedBy = "Terramate"
    }
  }
}
provider "grafana" {
  alias = "cloud"
}
