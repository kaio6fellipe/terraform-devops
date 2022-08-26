module "apps" {
  source        = "./apps"
  instance_type = var.instance_type
  environment   = var.environment
}

module "platform" {
  source                      = "./platform"
  instance_type               = var.instance_type
  ansible_instance_type       = var.ansible_instance_type
  db_instance_type            = var.db_instance_type
  rds_allocated_storage       = var.rds_allocated_storage
  rds_max_allocated_storage   = var.rds_max_allocated_storage
  environment                 = var.environment
  region                      = var.region
  amazon_linux_2              = data.aws_ami.amazon_linux_2.id
  key_name                    = "${var.key_name}-${var.environment}"
  vpc_id                      = local.vpc_id
  availability_zone_0         = local.availability_zone_0
  private_subnet_id_0         = local.private_subnet_id_0
  private_subnet_id_1         = local.private_subnet_id_1
  public_subnet_id_0          = local.public_subnet_id_0
  private_subnet_cidr_block_0 = local.private_subnet_cidr_block_0
  database_subnet_id_0        = local.database_subnet_id_0
  db_subnet_group_name        = local.db_subnet_group_name
  vpc_cidr                    = var.vpc_cidr
  SSH_PRIVATE_KEY             = var.SSH_PRIVATE_KEY
  private_dns_zone_name       = sort(keys(module.zones.route53_zone_zone_id))[0]
}
