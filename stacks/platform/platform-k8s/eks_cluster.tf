module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.13.0"

  cluster_name                   = local.name
  cluster_version                = local.cluster_version
  cluster_endpoint_public_access = true
  cluster_service_ipv4_cidr      = local.platform_eks_services
  create_cloudwatch_log_group    = false

  # EKS Addons
  cluster_addons = {
    coredns    = {}
    kube-proxy = {}
    vpc-cni    = {}
  }

  cluster_ip_family                    = "ipv4"
  vpc_id                               = local.vpc_id
  subnet_ids                           = local.vpc_private_subnets
  control_plane_subnet_ids             = local.vpc_intra_subnets
  manage_aws_auth_configmap            = true
  cluster_endpoint_public_access_cidrs = local.public_cidr_allow_list

  aws_auth_users = [
    {
      userarn  = var.ADMIN_USER_ARN
      username = var.ADMIN_USER_NAME
      groups   = ["system:masters"]
    },
  ]
  tags = local.tags
}
