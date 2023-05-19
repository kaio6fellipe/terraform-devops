locals {
  cluster_name                 = try(local.stacks_platform_platform-k8s_outputs.cluster_name, "null")
  cluster_id                   = try(local.stacks_platform_platform-k8s_outputs.cluster_id, "null")
  oidc_provider_arn            = try(local.stacks_platform_platform-k8s_outputs.oidc_provider_arn, "[null]")
  vpc_id                       = try(local.stacks_outputs.vpc_id, "[null]")
  ktech_devops_private_zone_id = try(local.stacks_outputs.ktech_devops_private_zone_id, "[null]")

  tags = {
    App = "platform-eks-${local.environment}"
  }
}
