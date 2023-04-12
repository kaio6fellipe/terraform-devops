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
    kubernetes_namespace.argocd
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
