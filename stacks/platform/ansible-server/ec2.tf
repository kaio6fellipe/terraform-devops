module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.1"

  name = "ansible-server01-${var.environment}"

  ami                  = var.amazon_linux_2
  instance_type        = var.ansible_instance_type
  key_name             = var.key_name
  monitoring           = false
  iam_instance_profile = aws_iam_instance_profile.ansible_ec2_profile.id

  availability_zone      = var.availability_zone_0
  subnet_id              = var.private_subnet_id_0
  vpc_security_group_ids = ["${aws_security_group.egress_ping.id}", "${var.default_sg}"]

  user_data = templatefile(
    "${abspath(path.cwd)}/platform/ansible-server/user_data.tpl",
    {
      environment            = var.environment
      region                 = var.region
      SSH_PRIVATE_KEY        = var.SSH_PRIVATE_KEY
      ANSIBLE_VAULT_PASSWORD = var.ANSIBLE_VAULT_PASSWORD
    }
  )

  tags = {
    Type = var.ansible_instance_type
    App  = "ansible-${var.environment}"
  }
}
