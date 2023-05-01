module "external_secrets_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.17.0"

  role_name                             = "external-secrets-${var.environment}"
  attach_external_secrets_policy        = true
  cluster_autoscaler_cluster_ids        = [module.eks.cluster_id]
  external_secrets_ssm_parameter_arns   = ["arn:aws:ssm:*:*:parameter/foo"]
  external_secrets_secrets_manager_arns = ["arn:aws:secretsmanager:*:*:secret:bar"]
  external_secrets_kms_key_arns         = ["arn:aws:kms:*:*:key/1234abcd-12ab-34cd-56ef-1234567890ab"]

  oidc_providers = {
    ex = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:external-secrets"]
    }
  }

  tags = local.tags
}
