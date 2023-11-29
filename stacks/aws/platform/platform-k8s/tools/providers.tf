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

provider "github" {}
