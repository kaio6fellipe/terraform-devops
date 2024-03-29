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
    value = local.cluster_name
  }

  set {
    name  = "region"
    value = local.globals.region
  }

  set {
    name  = "vpcId"
    value = local.vpc_id
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.load_balancer_controller_irsa.iam_role_arn
  }
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
}

resource "helm_release" "external_secrets" {
  chart            = "external-secrets"
  name             = "external-secrets"
  namespace        = "external-secrets"
  create_namespace = true
  repository       = "https://charts.external-secrets.io"
  version          = "0.8.1"
  force_update     = true

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.external_secrets_irsa.iam_role_arn
  }
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
    value = local.cluster_name
  }

  set {
    name  = "fullnameOverride"
    value = "cluster-autoscaler"
  }

  set {
    name  = "awsRegion"
    value = local.globals.region
  }

  set {
    name  = "rbac.serviceAccount.name"
    value = "cluster-autoscaler"
  }

  set {
    name  = "replicaCount"
    value = "2"
  }

  set {
    name  = "rbac.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.cluster_autoscaler_irsa.iam_role_arn
  }
}

resource "helm_release" "cert_manager" {
  chart            = "cert-manager"
  name             = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  repository       = "https://charts.jetstack.io"
  version          = "v1.11.1"
  force_update     = true

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.cert_manager_irsa.iam_role_arn
  }

  set {
    name  = "nameOverride"
    value = "cert-manager"
  }

  set {
    name  = "fullnameOverride"
    value = "cert-manager"
  }

  set {
    name  = "installCRDs"
    value = "true"
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = "cert-manager"
  }

  set {
    name  = "securityContext.fsGroup"
    value = "65534"
  }
}

resource "helm_release" "node_termination_handler" {
  chart        = "aws-node-termination-handler"
  name         = "aws-node-termination-handler"
  namespace    = "kube-system"
  repository   = "https://aws.github.io/eks-charts"
  version      = "0.21.0"
  force_update = true

  set {
    name  = "awsRegion"
    value = local.globals.region
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.node_termination_handler_irsa.iam_role_arn
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-node-termination-handler"
  }

  set {
    name  = "fullnameOverride"
    value = "aws-node-termination-handler"
  }
}

resource "helm_release" "crossplane" {
  chart            = "crossplane"
  name             = "crossplane"
  namespace        = "crossplane-system"
  create_namespace = true
  repository       = "https://charts.crossplane.io/stable"
  version          = "1.12.0"
  force_update     = true
  timeout          = 300
  wait             = false

  set {
    name  = "serviceAccount.customAnnotations.eks\\.amazonaws\\.com/role-arn"
    value = module.crossplane_irsa.iam_role_arn
  }

  set {
    name  = "args[0]"
    value = "--enable-environment-configs"
  }

  lifecycle {
    ignore_changes = all
  }
}

resource "helm_release" "argocd" {
  chart            = "argo-cd"
  name             = "argocd"
  namespace        = "argocd"
  create_namespace = true
  repository       = "https://argoproj.github.io/argo-helm"
  version          = "5.28.1"
  force_update     = true
  timeout          = 300
  wait             = false

  values = [
    sensitive(data.github_repository_file.argocd.content)
  ]

  depends_on = [
    helm_release.aws_load_balancer_controller,
    helm_release.external_dns,
    helm_release.external_secrets,
    helm_release.cluster_autoscaler,
    helm_release.cert_manager,
    helm_release.node_termination_handler,
    helm_release.crossplane,
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
  timeout          = 300
  wait             = false

  values = [
    sensitive(data.github_repository_file.argocd_apps.content)
  ]

  depends_on = [
    helm_release.aws_load_balancer_controller,
    helm_release.external_dns,
    helm_release.external_secrets,
    helm_release.cluster_autoscaler,
    helm_release.cert_manager,
    helm_release.node_termination_handler,
    helm_release.crossplane,
    helm_release.argocd,
  ]

  lifecycle {
    ignore_changes = all
  }
}
