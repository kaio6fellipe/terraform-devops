# provider "kubernetes" {
#   host                   = module.eks.cluster_endpoint
#   cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
# 
#   exec {
#     api_version = "client.authentication.k8s.io/v1beta1"
#     command     = "aws"
#     # This requires the awscli to be installed locally where Terraform is executed
#     args = ["sleep", "120", "&&" , "eks", "get-token", "--cluster-name", module.eks.cluster_name, "--region", var.region]
#   }
# }

# provider "kubernetes" {
#   host                   = data.aws_eks_cluster.default.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.default.certificate_authority[0].data)
#   token                  = data.aws_eks_cluster_auth.default.token
# }

provider "kubernetes" {
  host                   = try(data.external.aws_eks_cluster_endpoint.result.cluster_endpoint, "")
  cluster_ca_certificate = try(base64decode(data.external.aws_eks_cluster_ca_certificate.result.cluster_ca_certificate), "")
  token                  = try(data.external.aws_eks_cluster_token.result.cluster_token, "")
}

provider "helm" {
  kubernetes {
    host                   = try(data.external.aws_eks_cluster_endpoint.result.cluster_endpoint, "")
    cluster_ca_certificate = try(base64decode(data.external.aws_eks_cluster_ca_certificate.result.cluster_ca_certificate), "")
    token                  = try(data.external.aws_eks_cluster_token.result.cluster_token, "")
  }
}
