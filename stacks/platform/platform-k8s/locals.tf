locals {
  name                   = "${var.name}-${var.environment}"
  cluster_version        = var.kubernetes_version
  public_cidr_allow_list = concat(sort(var.cdirs_acesso_remoto), sort(var.GITHUB_ACTIONS_CIDR))
  azs                    = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    App = "platform-eks-${var.environment}"
  }

  vpc_id                       = try(local.stacks_outputs.vpc_id, "[null]")
  vpc_private_subnets          = try(local.stacks_outputs.vpc_private_subnets, "[null]")
  vpc_intra_subnets            = try(local.stacks_outputs.vpc_intra_subnets, "[null]")
  ktech_devops_private_zone_id = try(local.stacks_outputs.ktech_devops_private_zone_id, "[null]")
}
