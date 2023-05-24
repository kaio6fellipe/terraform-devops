locals {
  cluster_name                 = try(local.PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s_outputs.cluster_name, "null")
  cluster_id                   = try(local.PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s_outputs.cluster_id, "null")
  oidc_provider_arn            = try(local.PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s_outputs.oidc_provider_arn, "[null]")
  vpc_id                       = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks_outputs.vpc_id, "[null]")
  ktech_devops_private_zone_id = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks_outputs.ktech_devops_private_zone_id, "[null]")

  tags = {
    App = "platform-eks-${local.globals.environment}"
  }
}
