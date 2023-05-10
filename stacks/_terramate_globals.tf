// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

locals {
  ansible_instance_type     = "t3.small"
  database_subnet_a         = "10.1.201.0/24"
  database_subnet_b         = "10.1.202.0/24"
  database_subnet_c         = "10.1.203.0/24"
  db_instance_type          = "db.t3.small"
  environment               = "dev"
  hashcorp_aws_version      = "4.57.1"
  instance_type             = "t3.small"
  intra_subnet_a            = "10.1.51.0/24"
  intra_subnet_b            = "10.1.52.0/24"
  intra_subnet_c            = "10.1.53.0/24"
  key_name                  = "terraform-aws"
  platform_eks_services     = "10.2.0.0/16"
  private_subnet_a          = "10.1.1.0/24"
  private_subnet_b          = "10.1.2.0/24"
  private_subnet_c          = "10.1.3.0/24"
  public_subnet_a           = "10.1.101.0/24"
  public_subnet_b           = "10.1.102.0/24"
  public_subnet_c           = "10.1.103.0/24"
  rds_allocated_storage     = 10
  rds_max_allocated_storage = 20
  region                    = "us-east-1"
  terraform_version         = "1.2.4"
  vpc_cidr                  = "10.1.0.0/16"
}
