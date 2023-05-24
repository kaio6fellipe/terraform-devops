generate_hcl "_terramate_providers.tf" {
  content {
    provider "aws" {
      region = global.region
      default_tags {
        tags = {
          Env            = global.environment
          Stack          = terramate.stack.name
          StackID        = terramate.stack.id
          StackPath      = terramate.stack.path.absolute
          ManagedBy      = "Terraform"
          OrchestratedBy = "Terramate"
        }
      }
    }
  }
}
