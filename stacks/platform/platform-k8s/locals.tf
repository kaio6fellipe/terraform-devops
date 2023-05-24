locals {
  name                   = "${var.name}-${local.globals.environment}"
  cluster_version        = var.kubernetes_version
  public_cidr_allow_list = concat(sort(local.cidrs_remote_access), sort(var.GITHUB_ACTIONS_CIDR))
  # azs                    = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    App = "platform-eks-${local.globals.environment}"
  }

  vpc_id              = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks_outputs.vpc_id, "[null]")
  vpc_private_subnets = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks_outputs.vpc_private_subnets, ["null"])
  vpc_intra_subnets   = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks_outputs.vpc_intra_subnets, ["null"])
  cidrs_remote_access = try(local.RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y-platform_outputs.cidrs_remote_access, ["0.0.0.0/0"])
}
