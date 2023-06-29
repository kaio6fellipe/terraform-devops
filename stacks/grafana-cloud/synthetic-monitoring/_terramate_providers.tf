// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Env            = "dev"
      Stack          = "synthetic-monitoring"
      StackID        = "g94WrepXSjgd7QrbwuO2fzGLSvb3NGFYXdmh"
      ManagedBy      = "Terraform"
      OrchestratedBy = "Terramate"
    }
  }
}
provider "grafana" {
  alias = "cloud"
}
