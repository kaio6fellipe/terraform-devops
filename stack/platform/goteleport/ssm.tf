// SSM for Teleport Enterprise license storage and retrieval
resource "aws_ssm_parameter" "license" {
  count = var.license_path != "" ? 1 : 0
  name  = "/teleport/${local.cluster_name}/license"
  type  = "SecureString"
  value = "somelicence"
  # value     = file(var.license_path)
  overwrite = true
}
