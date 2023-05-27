data "github_repository_file" "argocd" {
  repository = "kaio6fellipe/argo"
  branch     = "main"
  file       = "config/argo-cd-values.yaml"
}

data "github_repository_file" "argocd_apps" {
  repository = "kaio6fellipe/argo"
  branch     = "main"
  file       = "config/argocd-apps-values.yaml"
}

data "external" "aws_eks_cluster_endpoint" {
  program = [
    "../../../../lib/eks-cluster-endpoint",
    local.cluster_name,
    local.globals.region,
  ]
}

data "external" "aws_eks_cluster_ca_certificate" {
  program = [
    "../../../../lib/eks-cluster-ca-certificate",
    local.cluster_name,
    local.globals.region,
  ]
}

data "external" "aws_eks_cluster_token" {
  program = [
    "../../../../lib/eks-cluster-token",
    local.cluster_name,
    local.globals.region,
  ]
}