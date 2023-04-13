resource "helm_release" "aws_load_balancer_controller" {
  chart      = "aws-load-balancer-controller"
  name       = "aws-load-balancer-controller"
  namespace  = "kube-system"
  repository = "https://aws.github.io/eks-charts"
  version    = "1.4.8"

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

  depends_on = [
    module.eks.aws_eks_cluster,
  ]
}

resource "helm_release" "argocd" {
  chart      = "argo-cd"
  name       = "argocd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name
  repository = "https://argoproj.github.io/argo-helm"
  version    = "5.28.1"

  values = [
    data.github_repository_file.argocd.content
  ]

  depends_on = [
    kubernetes_namespace.argocd,
    helm_release.aws_load_balancer_controller
  ]
}

resource "helm_release" "argocd_apps" {
  chart      = "argocd-apps"
  name       = "argocd-apps"
  namespace  = kubernetes_namespace.argocd.metadata[0].name
  repository = "https://argoproj.github.io/argo-helm"
  version    = "0.0.9"

  values = [
    data.github_repository_file.argocd_apps.content
  ]

  depends_on = [
    kubernetes_namespace.argocd,
    helm_release.argocd,
  ]
}
