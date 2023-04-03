module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "19.11.0"

  cluster_name                   = local.name
  cluster_version                = local.cluster_version
  cluster_endpoint_public_access = true

  # cluster_ip_family = "ipv4"

  cluster_addons = {
    kube-proxy = {}
    vpc-cni    = {}
    coredns = {
      configuration_values = jsonencode({
        computeType = "Fargate"
      })
    }
  }

  vpc_id                   = var.vpc_id
  subnet_ids               = var.vpc_private_subnets
  control_plane_subnet_ids = var.vpc_private_subnets

  create_cluster_security_group = false
  create_node_security_group    = false

  manage_aws_auth_configmap = true

  fargate_profile_defaults = {
    iam_role_additional_policies = {
      additional = aws_iam_policy.additional.arn
    }
  }

  fargate_profiles = {
    default = {
      name = "default"
      selectors = [
        {
          namespace = "kube-system"
          labels = {
            k8s-app = "kube-dns"
          }
        },
        {
          namespace = "default"
        }
      ]

      timeouts = {
        create = "20m"
        delete = "20m"
      }
    }
  }

  tags = local.tags
}
