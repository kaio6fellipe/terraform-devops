module "apps" {
  source        = "./apps"
  instance_type = var.instance_type
  environment   = var.environment
}

module "platform" {
  source                      = "./platform"
  instance_type               = var.instance_type
  ansible_instance_type       = var.ansible_instance_type
  environment                 = var.environment
  ubuntu2004_id               = data.aws_ami.ubuntu2004.id
  key_name                    = "${var.key_name}-${var.environment}"
  vpc_id                      = local.vpc_id
  availability_zone_0         = local.availability_zone_0
  private_subnet_id_0         = local.private_subnet_id_0
  public_subnet_id_0          = local.public_subnet_id_0
  private_subnet_cidr_block_0 = local.private_subnet_cidr_block_0
  vpc_cidr                    = var.vpc_cidr
}
