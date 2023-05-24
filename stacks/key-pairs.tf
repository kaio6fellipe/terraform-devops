resource "aws_key_pair" "terraform-aws" {
  key_name   = local.globals.key_name
  public_key = file("${abspath(path.cwd)}/${local.globals.key_name}.pub")
}
