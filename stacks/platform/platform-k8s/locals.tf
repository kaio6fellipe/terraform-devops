locals {
  name                   = "${var.name}-${local.environment}"
  cluster_version        = var.kubernetes_version
  public_cidr_allow_list = concat(sort(local.cidrs_remote_access), sort(var.GITHUB_ACTIONS_CIDR))
  # azs                    = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    App = "platform-eks-${local.environment}"
  }

  vpc_id              = try(local.stacks_outputs.vpc_id, "[null]")
  vpc_private_subnets = try(local.stacks_outputs.vpc_private_subnets, ["null"])
  vpc_intra_subnets   = try(local.stacks_outputs.vpc_intra_subnets, ["null"])
  cidrs_remote_access = try(local.stacks_platform_outputs.cidrs_remote_access, ["0.0.0.0/0"])
}
