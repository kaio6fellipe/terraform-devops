locals {
  cluster_name                      = try(local.stacks_platform_platform-k8s_outputs.cluster_name, "null")
  cluster_version                   = try(local.stacks_platform_platform-k8s_outputs.cluster_version, "null")
  cluster_primary_security_group_id = try(local.stacks_platform_platform-k8s_outputs.cluster_primary_security_group_id, "[null]")
  node_security_group_id            = try(local.stacks_platform_platform-k8s_outputs.node_security_group_id, "[null]")
  vpc_private_subnets               = try(local.stacks_outputs.vpc_private_subnets, ["null"])

  default_update_config = {
    max_unavailable_percentage = 33
  }

  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }
}
