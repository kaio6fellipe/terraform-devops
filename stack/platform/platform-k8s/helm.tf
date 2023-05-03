resource "helm_release" "aws_load_balancer_controller" {
  chart            = "aws-load-balancer-controller"
  name             = "aws-load-balancer-controller"
  namespace        = "kube-system"
  create_namespace = true
  repository       = "https://aws.github.io/eks-charts"
  version          = "1.4.8"
  force_update     = true

  set {
    name  = "clusterName"
    value = local.name
  }

  set {
    name  = "region"
    value = var.region
  }

  set {
    name  = "vpcId"
    value = var.vpc_id
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.load_balancer_controller_irsa.iam_role_arn
  }

  depends_on = [
    module.eks.eks_managed_node_groups,
  ]
}

resource "helm_release" "external_dns" {
  chart        = "external-dns"
  name         = "external-dns"
  namespace    = "kube-system"
  repository   = "https://kubernetes-sigs.github.io/external-dns"
  version      = "1.12.2"
  force_update = true

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.external_dns_irsa.iam_role_arn
  }

  depends_on = [
    module.eks.eks_managed_node_groups,
  ]
}

resource "helm_release" "external_secrets" {
  chart        = "external-secrets"
  name         = "external-secrets"
  namespace    = "kube-system"
  repository   = "https://charts.external-secrets.io"
  version      = "0.8.1"
  force_update = true

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.external_secrets_irsa.iam_role_arn
  }

  depends_on = [
    module.eks.eks_managed_node_groups,
  ]
}

resource "helm_release" "cluster_autoscaler" {
  chart        = "cluster-autoscaler"
  name         = "cluster-autoscaler"
  namespace    = "kube-system"
  repository   = "https://kubernetes.github.io/autoscaler"
  version      = "9.28.0"
  force_update = true

  set {
    name  = "autoDiscovery.clusterName"
    value = module.eks.cluster_name
  }

  set {
    name  = "awsRegion"
    value = var.region
  }

  set {
    name  = "rbac.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.cluster_autoscaler_irsa.iam_role_arn
  }

  depends_on = [
    module.eks.eks_managed_node_groups,
  ]
}

resource "helm_release" "argocd" {
  chart            = "argo-cd"
  name             = "argocd"
  namespace        = "argocd"
  create_namespace = true
  repository       = "https://argoproj.github.io/argo-helm"
  version          = "5.28.1"
  force_update     = true
  timeout          = 600
  wait             = false

  values = [
    data.github_repository_file.argocd.content
  ]

  depends_on = [
    helm_release.aws_load_balancer_controller,
    helm_release.external_dns,
    helm_release.external_secrets,
    helm_release.cluster_autoscaler,
    # time_sleep.wait_destroy_3_min,
  ]

  lifecycle {
    ignore_changes = all
  }
}

resource "helm_release" "argocd_apps" {
  chart            = "argocd-apps"
  name             = "argocd-apps"
  namespace        = "argocd"
  create_namespace = true
  repository       = "https://argoproj.github.io/argo-helm"
  version          = "0.0.9"
  force_update     = true
  timeout          = 600
  wait             = false

  values = [
    data.github_repository_file.argocd_apps.content
  ]

  depends_on = [
    helm_release.aws_load_balancer_controller,
    helm_release.external_dns,
    helm_release.external_secrets,
    helm_release.cluster_autoscaler,
    helm_release.argocd,
  ]

  lifecycle {
    ignore_changes = all
  }
}
