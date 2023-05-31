data "aws_caller_identity" "current" {}

# data "aws_availability_zones" "available" {}

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

data "external" "aws_eks_cluster_endpoint" {
  program = [
    "bash",
    "./eks-cluster-endpoint",
    module.eks.cluster_name,
    local.globals.region,
  ]
  depends_on = [
    module.eks.aws_eks_cluster,
  ]
}

data "external" "aws_eks_cluster_ca_certificate" {
  program = [
    "bash",
    "./eks-cluster-ca-certificate",
    module.eks.cluster_name,
    local.globals.region,
  ]
  depends_on = [
    module.eks.aws_eks_cluster,
  ]
}

data "external" "aws_eks_cluster_token" {
  program = [
    "bash",
    "./eks-cluster-token",
    module.eks.cluster_name,
    local.globals.region,
  ]
  depends_on = [
    module.eks.aws_eks_cluster,
  ]
}
