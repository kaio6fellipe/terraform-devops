# resource "time_sleep" "wait_3_minutes" {
#   depends_on = [module.eks]
# 
#   create_duration = "3m"
# }

resource "aws_eks_addon" "coredns" {
  cluster_name = module.eks.cluster_name
  addon_name   = "coredns"

  resolve_conflicts = "OVERWRITE"

  depends_on = [module.eks.eks_managed_node_groups]
}

# resource "aws_eks_addon" "kube_proxy" {
#   cluster_name = module.eks.cluster_name
#   addon_name   = "kube-proxy"
# 
#   resolve_conflicts = "OVERWRITE"
# }
# 
# resource "aws_eks_addon" "vpc_cni" {
#   cluster_name = module.eks.cluster_name
#   addon_name   = "vpc-cni"
# 
#   resolve_conflicts        = "OVERWRITE"
#   service_account_role_arn = module.vpc_cni_irsa.iam_role_arn
#   configuration_values = jsonencode({
#     env = {
#       # Reference docs https://docs.aws.amazon.com/eks/latest/userguide/cni-increase-ip-addresses.html
#       ENABLE_PREFIX_DELEGATION = "true"
#       WARM_PREFIX_TARGET       = "1"
#     }
#   })
# }

module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "19.11.0"

  cluster_name                   = local.name
  cluster_version                = local.cluster_version
  cluster_endpoint_public_access = true

  cluster_ip_family = "ipv4"

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
  }

  vpc_id                   = var.vpc_id
  subnet_ids               = var.vpc_private_subnets
  control_plane_subnet_ids = var.vpc_private_subnets

  manage_aws_auth_configmap = true

  eks_managed_node_group_defaults = {
    ami_type                   = "AL2_x86_64"
    instance_types             = var.instance_types
    iam_role_attach_cni_policy = true
  }

  eks_managed_node_groups = {
    # Default node group - as provided by AWS EKS
    # default_node_group = {
    #   # By default, the module creates a launch template to ensure tags are propagated to instances, etc.,
    #   # so we need to disable it to use the default template provided by the AWS EKS managed node group service
    #   use_custom_launch_template = false
# 
    #   disk_size = 50
# 
    #   # Remote access cannot be specified with a launch template
    #   remote_access = {
    #     ec2_ssh_key               = var.key_name
    #     source_security_group_ids = [var.default_sg]
    #   }
    # }

    # Complete
    complete = {
      name            = "complete-eks-mng-${var.environment}"
      use_name_prefix = true

      subnet_ids = var.vpc_private_subnets

      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size

      ami_id                     = data.aws_ami.eks_default.image_id
      enable_bootstrap_user_data = true

      pre_bootstrap_user_data = <<-EOT
        export FOO=bar
      EOT

      post_bootstrap_user_data = <<-EOT
        echo "you are free little kubelet!"
      EOT

      capacity_type        = "SPOT"
      force_update_version = true
      instance_types       = var.instance_types
      labels = {
        GithubRepo = "terraform-aws-eks"
      }

      taints = [
        {
          key    = "dedicated"
          value  = "gpuGroup"
          effect = "NO_SCHEDULE"
        }
      ]

      update_config = {
        max_unavailable_percentage = 33 # or set `max_unavailable`
      }

      description = "EKS managed node group example launch template"

      ebs_optimized           = true
      disable_api_termination = false
      enable_monitoring       = true

      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = 75
            volume_type           = "gp3"
            iops                  = 3000
            throughput            = 150
            encrypted             = true
            kms_key_id            = aws_kms_key.eks_k8s_platform.arn
            delete_on_termination = true
          }
        }
      }

      metadata_options = {
        http_endpoint               = "enabled"
        http_tokens                 = "required"
        http_put_response_hop_limit = 2
        instance_metadata_tags      = "disabled"
      }

      create_iam_role          = true
      iam_role_name            = "eks-managed-node-group-${var.environment}"
      iam_role_use_name_prefix = false
      iam_role_description     = "EKS managed node group for ${var.environment} env"
      iam_role_tags = {
        Purpose = "Protector of the kubelet"
      }
      iam_role_additional_policies = {
        AmazonEC2ContainerRegistryReadOnly = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
        additional                         = aws_iam_policy.node_additional.arn
      }

      tags = {
        ExtraTag = "EKS managed node group complete example"
      }
    }
  }

  tags = local.tags
}
