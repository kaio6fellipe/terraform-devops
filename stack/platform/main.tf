module "ansible_server" {
  source                 = "./ansible-server"
  ansible_instance_type  = var.ansible_instance_type
  environment            = var.environment
  region                 = var.region
  amazon_linux_2         = var.amazon_linux_2
  key_name               = var.key_name
  vpc_id                 = var.vpc_id
  availability_zone_0    = var.availability_zone_0
  private_subnet_id_0    = var.private_subnet_id_0
  default_sg             = aws_security_group.default_ansible.id
  SSH_PRIVATE_KEY        = var.SSH_PRIVATE_KEY
  private_dns_zone_id    = var.private_dns_zone_id
  private_dns_zone_name  = var.private_dns_zone_name
  ANSIBLE_VAULT_PASSWORD = var.ANSIBLE_VAULT_PASSWORD
}

module "bastion" {
  source                = "./bastion"
  instance_type         = var.instance_type
  environment           = var.environment
  amazon_linux_2        = var.amazon_linux_2
  key_name              = var.key_name
  vpc_id                = var.vpc_id
  availability_zone_0   = var.availability_zone_0
  public_subnet_id_0    = var.public_subnet_id_0
  default_sg            = aws_security_group.default_bastion.id
  cdirs_acesso_remoto   = var.cdirs_acesso_remoto
  private_dns_zone_id   = var.private_dns_zone_id
  private_dns_zone_name = var.private_dns_zone_name
  public_dns_zone_name  = data.aws_route53_zone.ktech_public.name
  public_dns_zone_id    = data.aws_route53_zone.ktech_public.zone_id
}

module "goteleport" {
  source        = "./goteleport"
  instance_type = var.instance_type
  environment   = var.environment
  key_name      = var.key_name
  vpc_id        = var.vpc_id
  # availability_zone_0 = var.availability_zone_0
  public_subnet_id_0  = var.public_subnet_id_0
  default_sg          = aws_security_group.default_platform.id
  cdirs_acesso_remoto = var.cdirs_acesso_remoto
  region              = var.region
  # private_dns_zone_id            = var.private_dns_zone_id
  # private_dns_zone_name          = var.private_dns_zone_name
  route53_zone = data.aws_route53_zone.ktech_public.name
  # public_dns_zone_id             = data.aws_route53_zone.ktech_public.zone_id
  # allow_bastion_ssh              = aws_security_group.allow_bastion_ssh.id
}

module "grafana_dashboards" {
  source                    = "./grafana-dashboards"
  instance_type             = var.instance_type
  db_instance_type          = var.db_instance_type
  rds_allocated_storage     = var.rds_allocated_storage
  rds_max_allocated_storage = var.rds_max_allocated_storage
  environment               = var.environment
  amazon_linux_2            = var.amazon_linux_2
  key_name                  = var.key_name
  vpc_id                    = var.vpc_id
  vpc_cidr                  = var.vpc_cidr
  availability_zone_1       = var.availability_zone_1
  private_subnet_id_1       = var.private_subnet_id_1
  availability_zone_2       = var.availability_zone_2
  private_subnet_id_2       = var.private_subnet_id_2
  public_subnet_id_1        = var.public_subnet_id_1
  public_subnet_id_2        = var.public_subnet_id_2
  default_sg                = aws_security_group.default_platform.id
  cdirs_acesso_remoto       = var.cdirs_acesso_remoto
  database_subnet_id_0      = var.database_subnet_id_0
  db_subnet_group_name      = var.db_subnet_group_name
  private_dns_zone_id       = var.private_dns_zone_id
  private_dns_zone_name     = var.private_dns_zone_name
  public_dns_zone_name      = data.aws_route53_zone.ktech_public.name
  public_dns_zone_id        = data.aws_route53_zone.ktech_public.zone_id
  AWS_RDS_PASSWORD          = var.AWS_RDS_PASSWORD
}

module "grafana_loki" {
  source                = "./grafana-loki"
  instance_type         = var.instance_type
  environment           = var.environment
  amazon_linux_2        = var.amazon_linux_2
  key_name              = var.key_name
  vpc_id                = var.vpc_id
  vpc_cidr              = var.vpc_cidr
  availability_zone_1   = var.availability_zone_1
  private_subnet_id_1   = var.private_subnet_id_1
  availability_zone_2   = var.availability_zone_2
  private_subnet_id_2   = var.private_subnet_id_2
  default_sg            = aws_security_group.default_platform.id
  private_dns_zone_id   = var.private_dns_zone_id
  private_dns_zone_name = var.private_dns_zone_name
}

module "grafana_mimir" {
  source                = "./grafana-mimir"
  instance_type         = var.instance_type
  environment           = var.environment
  amazon_linux_2        = var.amazon_linux_2
  key_name              = var.key_name
  vpc_id                = var.vpc_id
  vpc_cidr              = var.vpc_cidr
  availability_zone_1   = var.availability_zone_1
  private_subnet_id_1   = var.private_subnet_id_1
  availability_zone_2   = var.availability_zone_2
  private_subnet_id_2   = var.private_subnet_id_2
  default_sg            = aws_security_group.default_platform.id
  private_dns_zone_id   = var.private_dns_zone_id
  private_dns_zone_name = var.private_dns_zone_name
}

module "platform_k8s" {
  source = "./platform-k8s"
}