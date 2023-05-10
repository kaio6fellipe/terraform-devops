resource "aws_key_pair" "terraform-aws" {
  key_name   = "${local.key_name}-${local.environment}"
  public_key = file("${abspath(path.cwd)}/terraform-aws-${local.environment}.pub")
}
