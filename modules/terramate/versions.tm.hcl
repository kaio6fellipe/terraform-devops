generate_hcl "_terramate_versions.tf" {
  content {
    terraform {
      required_version = global.terraform_version[0]
      tm_dynamic "required_providers" {
        for_each   = global.terraform_version
        iterator   = terraform
        attributes = global.required_providers
      }
    }
  }
}
