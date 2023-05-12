resource "aws_key_pair" "terraform-aws" {
  key_name   = local.key_name
  public_key = file("${abspath(path.cwd)}/${local.key_name}.pub")
}
