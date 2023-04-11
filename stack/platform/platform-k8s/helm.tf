resource "helm_release" "argocd" {
  chart      = "argo-cd"
  name       = "argocd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name
  repository = "https://argoproj.github.io/argo-helm"
  version    = "5.28.1"

  values = [
    "${file("${path.module}/argo-cd-values.yaml")}"
  ]

  depends_on = [
    kubernetes_namespace.argocd
  ]
}
