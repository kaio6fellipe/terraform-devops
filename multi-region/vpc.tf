module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"
  
  name = "vpc-${var.region}-${var.environment}"
  cidr = "${var.vpc_cidr}"

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["${var.private_subnet_a}", "${var.private_subnet_b}", "${var.private_subnet_c}"]
  public_subnets  = ["${var.public_subnet_a}", "${var.public_subnet_b}", "${var.public_subnet_c}"]

  enable_ipv6 = false

  enable_nat_gateway = true
  single_nat_gateway = false
  one_nat_gateway_per_az = false

  tags = {
    Env = "${var.environment}"
  }

  vpc_tags = {
    Name = "vpc-${var.region}-${var.environment}"
  }
}

#Delete the default vpc & its components when destroy is run, this will work only if the default igw is detached from the default vpc
resource "aws_default_vpc" "default_vpc" {
    force_destroy = true
    tags = {
        Name = "Default VPC"
    }
}

resource "aws_default_subnet" "default_subnet_azs" {
  for_each          = toset(local.az_zone)
  availability_zone = each.value
  force_destroy     = true
  # vpc_id            = aws_default_vpc.default_vpc.id
  depends_on = [aws_default_vpc.default_vpc]
}

resource "aws_default_route_table" "default_rt" {
  depends_on             = [aws_default_vpc.default_vpc]
  default_route_table_id = aws_default_vpc.default_vpc.default_route_table_id

  route = []

  tags = {
    Name = "default-route-table"
  }
}

resource "aws_default_security_group" "default_sg" {
  depends_on = [aws_default_vpc.default_vpc]
  vpc_id     = aws_default_vpc.default_vpc.id
}

resource "aws_default_network_acl" "default_nacl" {
  depends_on             = [aws_default_vpc.default_vpc]
  default_network_acl_id = aws_default_vpc.default_vpc.default_network_acl_id
}

resource "aws_default_vpc_dhcp_options" "default_dhcp" {
  depends_on = [aws_default_vpc.default_vpc]
}