module "eks_cluster" {
  source  = "cloudposse/eks-cluster/aws"
  version = "2.6.0"

  region                       = var.region
  vpc_id                       = var.vpc_id
  subnet_ids                   = concat(var.vpc_private_subnets, var.vpc_public_subnets)
  kubernetes_version           = var.kubernetes_version
  local_exec_interpreter       = var.local_exec_interpreter
  oidc_provider_enabled        = var.oidc_provider_enabled
  enabled_cluster_log_types    = var.enabled_cluster_log_types
  cluster_log_retention_period = var.cluster_log_retention_period

  cluster_encryption_config_enabled                         = var.cluster_encryption_config_enabled
  cluster_encryption_config_kms_key_id                      = var.cluster_encryption_config_kms_key_id
  cluster_encryption_config_kms_key_enable_key_rotation     = var.cluster_encryption_config_kms_key_enable_key_rotation
  cluster_encryption_config_kms_key_deletion_window_in_days = var.cluster_encryption_config_kms_key_deletion_window_in_days
  cluster_encryption_config_kms_key_policy                  = var.cluster_encryption_config_kms_key_policy
  cluster_encryption_config_resources                       = var.cluster_encryption_config_resources

  addons = var.addons

  # We need to create a new Security Group only if the EKS cluster is used with unmanaged worker nodes.
  # EKS creates a managed Security Group for the cluster automatically, places the control plane and managed nodes into the security group,
  # and allows all communications between the control plane and the managed worker nodes
  # (EKS applies it to ENIs that are attached to EKS Control Plane master nodes and to any managed workloads).
  # If only Managed Node Groups are used, we don't need to create a separate Security Group;
  # otherwise we place the cluster in two SGs - one that is created by EKS, the other one that the module creates.
  # See https://docs.aws.amazon.com/eks/latest/userguide/sec-group-reqs.html for more details.
  create_security_group = false

  # This is to test `allowed_security_group_ids` and `allowed_cidr_blocks`
  # In a real cluster, these should be some other (existing) Security Groups and CIDR blocks to allow access to the cluster
  # allowed_security_group_ids = [module.vpc.vpc_default_security_group_id]
  allowed_cidr_blocks = [var.vpc_cidr]

  # For manual testing. In particular, set `false` if local configuration/state
  # has a cluster but the cluster was deleted by nightly cleanup, in order for
  # `terraform destroy` to succeed.
  apply_config_map_aws_auth = var.apply_config_map_aws_auth

  context = module.this.context
}

module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  attributes = ["cluster"]

  context = module.this.context
}
