module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.13.0"

  cluster_name                   = local.name
  cluster_version                = local.cluster_version
  cluster_endpoint_public_access = true
  cluster_service_ipv4_cidr      = var.platform_eks_services

  # EKS Addons
  cluster_addons = {
    coredns    = {}
    kube-proxy = {}
    vpc-cni    = {}
  }

  cluster_ip_family                    = "ipv4"
  vpc_id                               = var.vpc_id
  subnet_ids                           = var.vpc_private_subnets
  control_plane_subnet_ids             = var.vpc_intra_subnets
  manage_aws_auth_configmap            = true
  cluster_endpoint_public_access_cidrs = local.public_cidr_allow_list

  aws_auth_users = [
    {
      userarn  = var.ADMIN_USER_ARN
      username = var.ADMIN_USER_NAME
      groups   = ["system:masters"]
    },
  ]

  eks_managed_node_groups = {
    default = {
      # By default, the module creates a launch template to ensure tags are propagated to instances, etc.,
      # so we need to disable it to use the default template provided by the AWS EKS managed node group service
      use_custom_launch_template = false

      instance_types = var.instance_types
      capacity_type  = "SPOT"

      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size

      tags = {
        "k8s.io/cluster-autoscaler/enabled" = "true"
        "k8s.io/cluster-autoscaler/${local.name}" = "owned"
      }
    }
  }

  tags = local.tags
}
