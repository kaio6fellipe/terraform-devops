module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name = "vpc-${local.region}-${local.environment}"
  cidr = local.vpc_cidr

  azs              = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets  = ["${local.private_subnet_a}", "${local.private_subnet_b}", "${local.private_subnet_c}"]
  public_subnets   = ["${local.public_subnet_a}", "${local.public_subnet_b}", "${local.public_subnet_c}"]
  database_subnets = ["${local.database_subnet_a}", "${local.database_subnet_b}", "${local.database_subnet_c}"]

  create_database_subnet_group = true
  enable_ipv6                  = false
  enable_nat_gateway           = true
  single_nat_gateway           = true
  one_nat_gateway_per_az       = false
  enable_dns_hostnames         = true
  enable_dns_support           = true

  vpc_tags = {
    Name = "vpc-${local.region}-${local.environment}"
  }
}
