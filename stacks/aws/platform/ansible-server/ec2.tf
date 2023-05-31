module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.1"

  name = "ansible-server01-${local.globals.environment}"

  ami                  = local.amazon_linux_2
  instance_type        = local.globals.ansible_instance_type
  key_name             = local.globals.key_name
  monitoring           = false
  iam_instance_profile = aws_iam_instance_profile.ansible_ec2_profile.id

  availability_zone      = local.availability_zone_0
  subnet_id              = local.private_subnet_id_0
  vpc_security_group_ids = [aws_security_group.egress_ping.id, local.ansible_default_sg]

  user_data = templatefile(
    "${abspath(path.cwd)}/user_data.tpl",
    {
      environment            = local.globals.environment
      region                 = local.globals.region
      SSH_PRIVATE_KEY        = var.SSH_PRIVATE_KEY
      ANSIBLE_VAULT_PASSWORD = var.ANSIBLE_VAULT_PASSWORD
    }
  )

  tags = {
    Type = local.globals.ansible_instance_type
    App  = "ansible-${local.globals.environment}"
  }
}
