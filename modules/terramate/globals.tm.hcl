generate_hcl "_terramate_globals.tf" {
  content {
    locals {
      terraform_version         = global.terraform_version
      hashcorp_aws_version      = global.hashcorp_aws_version
      environment               = global.environment
      key_name                  = global.key_name
      region                    = global.region
      ansible_instance_type     = global.ansible_instance_type
      instance_type             = global.instance_type
      db_instance_type          = global.db_instance_type
      vpc_cidr                  = global.vpc_cidr
      private_subnet_a          = global.private_subnet_a
      public_subnet_a           = global.public_subnet_a
      intra_subnet_a            = global.intra_subnet_a
      private_subnet_b          = global.private_subnet_b
      public_subnet_b           = global.public_subnet_b
      intra_subnet_b            = global.intra_subnet_b
      private_subnet_c          = global.private_subnet_c
      public_subnet_c           = global.public_subnet_c
      intra_subnet_c            = global.intra_subnet_c
      database_subnet_a         = global.database_subnet_a
      database_subnet_b         = global.database_subnet_b
      database_subnet_c         = global.database_subnet_c
      platform_eks_services     = global.platform_eks_services
      rds_allocated_storage     = global.rds_allocated_storage
      rds_max_allocated_storage = global.rds_max_allocated_storage
    }
  }
}
