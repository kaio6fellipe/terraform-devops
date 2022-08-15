module "ansible_server" {
  source                = "./ansible-server"
  ansible_instance_type = var.ansible_instance_type
  environment           = var.environment
  region                = var.region
  amazon_linux_2        = var.amazon_linux_2
  key_name              = var.key_name
  availability_zone_0   = var.availability_zone_0
  private_subnet_id_0   = var.private_subnet_id_0
  allow_bastion_ssh     = aws_security_group.allow_bastion_ssh.id
  allow_outbound        = aws_security_group.allow_outbound.id
  allow_ping            = aws_security_group.allow_ping.id
  SSH_PRIVATE_KEY       = var.SSH_PRIVATE_KEY
}

module "bastion" {
  source                         = "./bastion"
  instance_type                  = var.instance_type
  environment                    = var.environment
  amazon_linux_2                 = var.amazon_linux_2
  key_name                       = var.key_name
  vpc_id                         = var.vpc_id
  availability_zone_0            = var.availability_zone_0
  public_subnet_id_0             = var.public_subnet_id_0
  allow_ansible_admin_subnet_ssh = aws_security_group.allow_ansible_admin_subnet_ssh.id
  allow_outbound                 = aws_security_group.allow_outbound.id
  allow_ping                     = aws_security_group.allow_ping.id
  SSH_PRIVATE_KEY                = var.SSH_PRIVATE_KEY
}
