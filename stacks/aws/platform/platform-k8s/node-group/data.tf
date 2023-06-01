data "external" "aws_eks_cluster_endpoint" {
  program = [
    "../../../../lib/eks-cluster-endpoint",
    local.cluster_name,
    local.region,
  ]
}

data "external" "aws_eks_cluster_ca_certificate" {
  program = [
    "../../../../lib/eks-cluster-ca-certificate",
    local.cluster_name,
    local.region,
  ]
}

data "external" "aws_eks_cluster_token" {
  program = [
    "../../../../lib/eks-cluster-token",
    local.cluster_name,
    local.region,
  ]
}