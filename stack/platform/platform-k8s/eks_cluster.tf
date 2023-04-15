module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "19.11.0"

  cluster_name                   = local.name
  cluster_version                = local.cluster_version
  cluster_endpoint_public_access = true
  cluster_service_ipv4_cidr      = var.platform_eks_services

  # cluster_ip_family = "ipv4"

  cluster_addons = {
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent              = true
      before_compute           = true
      service_account_role_arn = module.vpc_cni_irsa.iam_role_arn
      configuration_values = jsonencode({
        env = {
          # Reference docs https://docs.aws.amazon.com/eks/latest/userguide/cni-increase-ip-addresses.html
          ENABLE_PREFIX_DELEGATION = "true"
          WARM_PREFIX_TARGET       = "1"
        }
      })
    }
    coredns = {
      most_recent = true
    }
  }

  vpc_id                   = var.vpc_id
  subnet_ids               = var.vpc_private_subnets
  control_plane_subnet_ids = var.vpc_private_subnets

  create_cluster_security_group = true
  create_node_security_group    = true

  manage_aws_auth_configmap = true

  # aws_auth_roles = [
  #   {
  #     rolearn  = "arn:aws:iam::66666666666:role/role1"
  #     username = "role1"
  #     groups   = ["system:masters"]
  #   },
  # ]

  cluster_endpoint_public_access_cidrs = local.public_cidr_allow_list

  aws_auth_users = [
    {
      userarn  = var.ADMIN_USER_ARN
      username = var.ADMIN_USER_NAME
      groups   = ["system:masters"]
    },
  ]

  cluster_identity_providers = {
    sts = {
      client_id = "sts.amazonaws.com"
    }
  }

  iam_role_additional_policies = {
    additional = aws_iam_policy.additional.arn
  }

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types             = var.instance_types
    iam_role_attach_cni_policy = true
  }

  eks_managed_node_groups = {
    blue = {}
    green = {
      name            = "${local.name}-green"
      use_name_prefix = true
      min_size        = var.min_size
      max_size        = var.max_size
      desired_size    = var.desired_size

      instance_types = var.instance_types
      capacity_type  = "SPOT"
    }
  }

  tags = local.tags
}
