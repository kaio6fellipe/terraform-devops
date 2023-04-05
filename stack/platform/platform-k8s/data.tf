data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {}

data "aws_eks_cluster" "default" {
  name = module.eks.cluster_name
  depends_on = [
    module.eks.fargate_profile,
  ]
}

data "aws_eks_cluster_auth" "default" {
  name = module.eks.cluster_name
  depends_on = [
    module.eks.fargate_profile,
  ]
}