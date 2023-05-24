config {
  # format = "compact"
  plugin_dir = "./.tflint.d/plugins"

  module = true
  force = true
  disabled_by_default = false

  # ignore_module = {
  #   "terraform-aws-modules/vpc/aws"            = true
  #   "terraform-aws-modules/security-group/aws" = true
  # }
}

rule "terraform_unused_declarations" {
  enabled = false
}

# plugin "terraform" {
#     enabled = true
#     preset  = "recommended"
# }

plugin "aws" {
    enabled = true
    version = "0.18.0"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
}
