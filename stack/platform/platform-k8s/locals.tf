locals {
  name            = "${var.name}-${var.environment}"
  cluster_version = var.kubernetes_version
  region          = var.region

  vpc_cidr = var.vpc_cidr
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    App  = "platform-eks-${var.environment}"
  }
}