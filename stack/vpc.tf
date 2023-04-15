module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name = "vpc-${var.region}-${var.environment}"
  cidr = var.vpc_cidr

  azs              = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets  = ["${var.private_subnet_a}", "${var.private_subnet_b}", "${var.private_subnet_c}"]
  intra_subnets    = ["${var.intra_subnet_a}", "${var.intra_subnet_b}", "${var.intra_subnet_c}"]
  public_subnets   = ["${var.public_subnet_a}", "${var.public_subnet_b}", "${var.public_subnet_c}"]
  database_subnets = ["${var.database_subnet_a}", "${var.database_subnet_b}", "${var.database_subnet_c}"]

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
    Name = "vpc-${var.region}-${var.environment}"
  }
}

resource "aws_default_vpc" "default" {
  #checkov:skip=CKV_AWS_148: Default VPC it's going to be destroyed
  #force_destroy = true
}
