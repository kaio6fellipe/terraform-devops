module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name = "vpc-${var.region}-${var.environment}"
  cidr = var.vpc_cidr

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["${var.private_subnet_a}", "${var.private_subnet_b}", "${var.private_subnet_c}"]
  public_subnets  = ["${var.public_subnet_a}", "${var.public_subnet_b}", "${var.public_subnet_c}"]

  enable_ipv6 = false

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  vpc_tags = {
    Name = "vpc-${var.region}-${var.environment}"
  }
}
