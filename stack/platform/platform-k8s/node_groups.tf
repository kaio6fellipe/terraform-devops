module "eks_managed_node_group" {
  source  = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version = "19.13.0"

  create = false

  name            = "${local.name}-green"
  use_name_prefix = true
  cluster_name    = module.eks.cluster_name
  cluster_version = module.eks.cluster_version

  subnet_ids                        = var.vpc_private_subnets
  cluster_primary_security_group_id = module.eks.cluster_primary_security_group_id
  vpc_security_group_ids = [
    module.eks.cluster_security_group_id,
    module.eks.node_security_group_id
  ]

  instance_types             = var.instance_types
  iam_role_attach_cni_policy = true
  capacity_type              = "SPOT"

  min_size     = var.min_size
  max_size     = var.max_size
  desired_size = var.desired_size

  tags = merge(local.tags, { Separate = "eks-managed-node-group" })
}
