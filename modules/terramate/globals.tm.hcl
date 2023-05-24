generate_hcl "_terramate_globals.tf" {
  content {
    locals {
      globals = global
    }
  }
}
