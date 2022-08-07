module "ansible_server" {
  source                = "./ansible-server"
  ansible_instance_type = var.ansible_instance_type
  environment           = var.environment
  ubuntu2004_id         = var.ubuntu2004_id
  key_name              = var.key_name
  availability_zone_0   = var.availability_zone_0
  private_subnet_id_0   = var.private_subnet_id_0
  allow_bastion_ssh     = aws_security_group.allow_bastion_ssh.id
}

module "bastion" {
  source                         = "./bastion"
  instance_type                  = var.instance_type
  environment                    = var.environment
  ubuntu2004_id                  = var.ubuntu2004_id
  key_name                       = var.key_name
  vpc_id                         = var.vpc_id
  availability_zone_0            = var.availability_zone_0
  public_subnet_id_0             = var.public_subnet_id_0
  allow_ansible_admin_subnet_ssh = aws_security_group.allow_ansible_admin_subnet_ssh.id
}
