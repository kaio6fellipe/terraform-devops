locals {
  namespace                   = "loki"
  serviceaccount              = "loki"
  bucket_name                 = "loki-bucket-ktech-br-${local.environment}"
  current_identity_account_id = try(local.stacks_platform_platform-k8s_outputs.current_identity_account_id, "null")
  oidc_id                     = try(local.stacks_platform_platform-k8s_outputs.oidc_provider, "null")
  cluster_name                = try(local.stacks_platform_platform-k8s_outputs.cluster_name, "null")
}
