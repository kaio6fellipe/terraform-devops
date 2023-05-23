module "grafana_rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.0.3"

  identifier = local.rds_identifier

  engine               = "postgres"
  engine_version       = "14.1"
  family               = "postgres14"
  major_engine_version = "14"
  instance_class       = local.db_instance_type

  allocated_storage     = local.rds_allocated_storage
  max_allocated_storage = local.rds_max_allocated_storage

  db_name                = "grafana"
  username               = "grafana_usr"
  port                   = 5432
  password               = var.AWS_RDS_PASSWORD
  create_random_password = false

  multi_az               = false
  db_subnet_group_name   = local.database_subnet_group_name # vpc-us-east-1-dev
  vpc_security_group_ids = [module.sg_grafana_db.security_group_id]

  deletion_protection = false
  storage_encrypted   = false
  snapshot_identifier = data.aws_db_snapshot.db_snapshot.id

  # restore_to_point_in_time = {
  #   use_latest_restorable_time = true
  # }
}
