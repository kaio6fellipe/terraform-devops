module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name = "vpc-${local.globals.region}-${local.globals.environment}"
  cidr = local.globals.vpc_cidr

  azs              = ["${local.globals.region}a", "${local.globals.region}b", "${local.globals.region}c"]
  private_subnets  = [local.globals.private_subnet_a, local.globals.private_subnet_b, local.globals.private_subnet_c]
  intra_subnets    = [local.globals.intra_subnet_a, local.globals.intra_subnet_b, local.globals.intra_subnet_c]
  public_subnets   = [local.globals.public_subnet_a, local.globals.public_subnet_b, local.globals.public_subnet_c]
  database_subnets = [local.globals.database_subnet_a, local.globals.database_subnet_b, local.globals.database_subnet_c]

  create_database_subnet_group = true
  enable_ipv6                  = false
  enable_nat_gateway           = true
  single_nat_gateway           = true
  one_nat_gateway_per_az       = false
  enable_dns_hostnames         = true
  enable_dns_support           = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }

  vpc_tags = {
    Name = "vpc-${local.globals.region}-${local.globals.environment}"
  }
}
