module "grafana_rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.0.3"

  identifier = "grafana-rds-${var.environment}"

  engine               = "postgres"
  engine_version       = "14.1"
  family               = "postgres14"
  major_engine_version = "14"
  instance_class       = var.db_instance_type

  allocated_storage     = var.rds_allocated_storage
  max_allocated_storage = var.rds_max_allocated_storage

  db_name  = "grafana"
  username = "grafana_usr"
  port     = 5432

  multi_az               = false
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [module.sg_grafana_db.security_group_id]

  deletion_protection = false
  storage_encrypted   = false
}
