generate_file "_terramate_globals.tf" {
  content = <<-EOT
    // TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

    locals {
      # tflint-ignore: terraform_unused_declarations
      environment = "${global.environment}"
      # tflint-ignore: terraform_unused_declarations
      key_name = "${global.key_name}"
      # tflint-ignore: terraform_unused_declarations
      region = "${global.region}"
      # tflint-ignore: terraform_unused_declarations
      ansible_instance_type = "${global.ansible_instance_type}"
      # tflint-ignore: terraform_unused_declarations
      instance_type = "${global.instance_type}"
      # tflint-ignore: terraform_unused_declarations
      db_instance_type = "${global.db_instance_type}"
      # tflint-ignore: terraform_unused_declarations
      vpc_cidr = "${global.vpc_cidr}"
      # tflint-ignore: terraform_unused_declarations
      private_subnet_a = "${global.private_subnet_a}"
      # tflint-ignore: terraform_unused_declarations
      public_subnet_a = "${global.public_subnet_a}"
      # tflint-ignore: terraform_unused_declarations
      intra_subnet_a = "${global.intra_subnet_a}"
      # tflint-ignore: terraform_unused_declarations
      private_subnet_b = "${global.private_subnet_b}"
      # tflint-ignore: terraform_unused_declarations
      public_subnet_b = "${global.public_subnet_b}"
      # tflint-ignore: terraform_unused_declarations
      intra_subnet_b = "${global.intra_subnet_b}"
      # tflint-ignore: terraform_unused_declarations
      private_subnet_c = "${global.private_subnet_c}"
      # tflint-ignore: terraform_unused_declarations
      public_subnet_c = "${global.public_subnet_c}"
      # tflint-ignore: terraform_unused_declarations
      intra_subnet_c = "${global.intra_subnet_c}"
      # tflint-ignore: terraform_unused_declarations
      database_subnet_a = "${global.database_subnet_a}"
      # tflint-ignore: terraform_unused_declarations
      database_subnet_b = "${global.database_subnet_b}"
      # tflint-ignore: terraform_unused_declarations
      database_subnet_c = "${global.database_subnet_c}"
      # tflint-ignore: terraform_unused_declarations
      platform_eks_services = "${global.platform_eks_services}"
      # tflint-ignore: terraform_unused_declarations
      rds_allocated_storage = ${global.rds_allocated_storage}
      # tflint-ignore: terraform_unused_declarations
      rds_max_allocated_storage = ${global.rds_max_allocated_storage}
    }
    EOT
}
