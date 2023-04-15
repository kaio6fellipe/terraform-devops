resource "time_sleep" "wait_destroy_3_min" {
  depends_on = [helm_release.aws_load_balancer_controller]

  destroy_duration = "5m"
}

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
    value = module.load_balancer_controller_targetgroup_binding_only_irsa_role.iam_role_arn
  }

  depends_on = [
    module.eks.eks_managed_node_groups,
  ]
}

resource "helm_release" "external_dns" {
  chart        = "external-dns"
  name         = "external-dns"
  repository   = "https://kubernetes-sigs.github.io/external-dns"
  version      = "1.12.2"
  force_update = true

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

  values = [
    data.github_repository_file.argocd.content
  ]

  depends_on = [
    helm_release.aws_load_balancer_controller,
    time_sleep.wait_destroy_3_min,
  ]
}

resource "helm_release" "argocd_apps" {
  chart            = "argocd-apps"
  name             = "argocd-apps"
  namespace        = "argocd"
  create_namespace = true
  repository       = "https://argoproj.github.io/argo-helm"
  version          = "0.0.9"
  force_update     = true

  values = [
    data.github_repository_file.argocd_apps.content
  ]

  depends_on = [
    helm_release.argocd,
  ]
}
