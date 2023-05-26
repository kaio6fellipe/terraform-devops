locals {
  namespace                   = "mimir"
  serviceaccount              = "mimir"
  bucket_name                 = "mimir-bucket-ktech-br-${local.globals.environment}"
  current_identity_account_id = try(local.PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s_outputs.current_identity_account_id, "null")
  oidc_id                     = try(local.PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s_outputs.oidc_provider, "null")
  cluster_name                = try(local.PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s_outputs.cluster_name, "null")
}
