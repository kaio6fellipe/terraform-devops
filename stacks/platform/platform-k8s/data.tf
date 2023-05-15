data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {}

#data "aws_eks_cluster" "default" {
#  name = module.eks.cluster_name
#  depends_on = [
#    module.eks.fargate_profile,
#  ]
#}

#data "aws_eks_cluster_auth" "default" {
#  name = module.eks.cluster_name
#  depends_on = [
#    module.eks.fargate_profile,
#  ]
#}

# resource "time_sleep" "wait_1_minutes" {
#   depends_on = [
#     module.eks.fargate_profile,
#   ]
# 
#   create_duration = "1m"
# }

# External data sources for testing
data "external" "aws_eks_cluster_endpoint" {
  program = [
    "${abspath(path.cwd)}/eks-cluster-endpoint.sh",
    "${module.eks.cluster_name}",
    "${local.region}",
  ]
  depends_on = [
    module.eks.aws_eks_cluster,
  ]
}

data "external" "aws_eks_cluster_ca_certificate" {
  program = [
    "${abspath(path.cwd)}/eks-cluster-ca-certificate.sh",
    "${module.eks.cluster_name}",
    "${local.region}",
  ]
  depends_on = [
    module.eks.aws_eks_cluster,
  ]
}

data "external" "aws_eks_cluster_token" {
  program = [
    "${abspath(path.cwd)}/eks-cluster-token.sh",
    "${module.eks.cluster_name}",
    "${local.region}",
  ]
  depends_on = [
    module.eks.aws_eks_cluster,
  ]
}

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
