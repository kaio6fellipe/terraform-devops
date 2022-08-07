provider "aws" {
  alias  = "use1"
  region = "us-east-1"

  default_tags {
    tags = {
      Env = var.environment
      ManagedBy = "Terraform"
    }
  }
}

provider "aws" {
  alias  = "sae1"
  region = "sa-east-1"

  default_tags {
    tags = {
      Env = var.environment
      ManagedBy = "Terraform"
    }
  }
}
