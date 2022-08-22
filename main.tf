module "us-east-1" {
  source                    = "./multi-region/"
  instance_type             = var.instance_type
  ansible_instance_type     = var.ansible_instance_type
  db_instance_type          = var.db_instance_type
  rds_allocated_storage     = var.rds_allocated_storage
  rds_max_allocated_storage = var.rds_max_allocated_storage
  environment               = var.environment
  region                    = "us-east-1"
  vpc_cidr                  = var.vpc_cidr
  private_subnet_a          = var.private_subnet_a
  public_subnet_a           = var.public_subnet_a
  private_subnet_b          = var.private_subnet_b
  public_subnet_b           = var.public_subnet_b
  private_subnet_c          = var.private_subnet_c
  public_subnet_c           = var.public_subnet_c
  database_subnet_a         = var.database_subnet_a
  database_subnet_b         = var.database_subnet_b
  database_subnet_c         = var.database_subnet_c
  SSH_PRIVATE_KEY           = var.SSH_PRIVATE_KEY
  providers = {
    aws = aws.use1
  }
}

# module "sa-east-1" {
#   source                = "./multi-region"
#   instance_type         = var.instance_type
#   ansible_instance_type = var.ansible_instance_type
#   environment           = var.environment
#   region                = "sa-east-1"
#   vpc_cidr              = var.vpc_cidr
#   private_subnet_a      = var.private_subnet_a
#   public_subnet_a       = var.public_subnet_a
#   private_subnet_b      = var.private_subnet_b
#   public_subnet_b       = var.public_subnet_b
#   private_subnet_c      = var.private_subnet_c
#   public_subnet_c       = var.public_subnet_c
#   providers = {
#     aws = aws.sae1
#   }
# }

module "apps" {
  source        = "./apps/"
  environment   = var.environment
  instance_type = var.instance_type
}

module "platform" {
  source        = "./platform/"
  environment   = var.environment
  instance_type = var.instance_type
}
