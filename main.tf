module "us-east-1" {
  source                             = "./stack/"
  instance_type                      = var.instance_type
  ansible_instance_type              = var.ansible_instance_type
  db_instance_type                   = var.db_instance_type
  rds_allocated_storage              = var.rds_allocated_storage
  rds_max_allocated_storage          = var.rds_max_allocated_storage
  environment                        = var.environment
  region                             = "us-east-1"
  vpc_cidr                           = var.vpc_cidr
  private_subnet_a                   = var.private_subnet_a
  public_subnet_a                    = var.public_subnet_a
  intra_subnet_a                     = var.intra_subnet_a
  private_subnet_b                   = var.private_subnet_b
  public_subnet_b                    = var.public_subnet_b
  intra_subnet_b                     = var.intra_subnet_b
  private_subnet_c                   = var.private_subnet_c
  public_subnet_c                    = var.public_subnet_c
  intra_subnet_c                     = var.intra_subnet_c
  database_subnet_a                  = var.database_subnet_a
  database_subnet_b                  = var.database_subnet_b
  database_subnet_c                  = var.database_subnet_c
  platform_eks_services              = var.platform_eks_services
  SSH_PRIVATE_KEY                    = var.SSH_PRIVATE_KEY
  AWS_RDS_PASSWORD                   = var.AWS_RDS_PASSWORD
  ANSIBLE_VAULT_PASSWORD             = var.ANSIBLE_VAULT_PASSWORD
  ADMIN_USER_ARN                     = var.ADMIN_USER_ARN
  ADMIN_USER_NAME                    = var.ADMIN_USER_NAME
  ARGO_GITHUB_SSO_SECRET_KEY         = var.ARGO_GITHUB_SSO_SECRET_KEY
  GITHUB_ACTIONS_CIDR                = var.GITHUB_ACTIONS_CIDR
  CROSSPLANE_AWS_CREDENTIALS_CONTENT = var.CROSSPLANE_AWS_CREDENTIALS_CONTENT
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
