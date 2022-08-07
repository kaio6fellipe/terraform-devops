resource "aws_key_pair" "terraform-aws" {
  key_name   = "${var.key_name}-${var.environment}"
  public_key = file("${abspath(path.cwd)}/multi-region/terraform-aws-${var.environment}.pub")
}
