generate_hcl "_terramate_providers.tf" {
  content {
    provider "aws" {
      region = "us-east-1"
      default_tags {
        tags = {
          Env            = global.environment
          Stack          = terramate.stack.name
          StackPath      = terramate.stack.path.absolute
          ManagedBy      = "Terraform"
          OrchestratedBy = "Terramate"
        }
      }
    }
  }
}
