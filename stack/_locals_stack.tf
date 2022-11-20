locals {
  instance_type             = data.terraform_remote_state.base_foundation.outputs.instance_type
  ansible_instance_type     = data.terraform_remote_state.base_foundation.outputs.ansible_instance_type
  db_instance_type          = data.terraform_remote_state.base_foundation.outputs.db_instance_type
  rds_allocated_storage     = data.terraform_remote_state.base_foundation.outputs.rds_allocated_storage
  rds_max_allocated_storage = data.terraform_remote_state.base_foundation.outputs.rds_max_allocated_storage
  environment               = data.terraform_remote_state.base_foundation.outputs.environment
  region                    = data.terraform_remote_state.base_foundation.outputs.region
  vpc_cidr                  = data.terraform_remote_state.base_foundation.outputs.vpc_cidr
  private_subnet_a          = data.terraform_remote_state.base_foundation.outputs.private_subnet_a
  public_subnet_a           = data.terraform_remote_state.base_foundation.outputs.public_subnet_a
  private_subnet_b          = data.terraform_remote_state.base_foundation.outputs.private_subnet_b
  public_subnet_b           = data.terraform_remote_state.base_foundation.outputs.public_subnet_b
  private_subnet_c          = data.terraform_remote_state.base_foundation.outputs.private_subnet_c
  public_subnet_c           = data.terraform_remote_state.base_foundation.outputs.public_subnet_c
  database_subnet_a         = data.terraform_remote_state.base_foundation.outputs.database_subnet_a
  database_subnet_b         = data.terraform_remote_state.base_foundation.outputs.database_subnet_b
  database_subnet_c         = data.terraform_remote_state.base_foundation.outputs.database_subnet_c
}


