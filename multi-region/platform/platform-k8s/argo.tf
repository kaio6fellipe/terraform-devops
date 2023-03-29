module "argocd_self_managed_helm" {
  source  = "github.com/lablabs/terraform-aws-eks-argocd?ref=v0.1.3"

  cluster_identity_oidc_issuer     = module.eks_cluster.eks_cluster_identity_oidc_issuer
  cluster_identity_oidc_issuer_arn = module.eks_cluster.eks_cluster_identity_oidc_issuer_arn

  enabled           = true
  argo_enabled      = true
  argo_helm_enabled = true

  self_managed = true

  helm_release_name = "argocd-helm"
  namespace         = "argocd-helm"

  argo_namespace = "argo"
  argo_sync_policy = {
    "automated" : {}
    "syncOptions" = ["CreateNamespace=true"]
  }
}
