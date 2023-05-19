module "default_eks_managed_node_groups" {
  source  = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version = "19.13.0"

  create = true

  cluster_name      = local.cluster_name
  cluster_version   = local.cluster_version
  cluster_ip_family = "ipv4"

  # EKS Managed Node Group
  name            = "default-node-group"
  use_name_prefix = true

  subnet_ids = local.vpc_private_subnets

  min_size     = var.min_size
  max_size     = var.max_size
  desired_size = var.desired_size

  ami_id              = ""
  ami_type            = null
  ami_release_version = null

  capacity_type        = "SPOT"
  disk_size            = null
  force_update_version = null
  instance_types       = var.instance_types
  labels               = null

  remote_access = {}
  taints        = {}
  update_config = local.default_update_config
  timeouts      = {}

  # User data
  platform                   = "linux"
  cluster_endpoint           = try(data.external.aws_eks_cluster_endpoint.result.cluster_endpoint, "")
  cluster_auth_base64        = try(base64decode(data.external.aws_eks_cluster_ca_certificate.result.cluster_ca_certificate), "")
  cluster_service_ipv4_cidr  = local.platform_eks_services
  enable_bootstrap_user_data = false
  pre_bootstrap_user_data    = ""
  post_bootstrap_user_data   = ""
  bootstrap_extra_args       = ""
  user_data_template_path    = ""

  # Launch Template
  create_launch_template                 = true
  use_custom_launch_template             = false
  launch_template_id                     = ""
  launch_template_name                   = "default-node-group"
  launch_template_use_name_prefix        = true
  launch_template_version                = null
  launch_template_default_version        = null
  update_launch_template_default_version = true
  launch_template_description            = "Custom launch template for default-node-group EKS managed node group"
  launch_template_tags                   = {}
  tag_specifications                     = ["instance", "volume", "network-interface"]

  ebs_optimized           = null
  key_name                = null
  disable_api_termination = null
  kernel_id               = null
  ram_disk_id             = null

  block_device_mappings              = {}
  capacity_reservation_specification = {}
  cpu_options                        = {}
  credit_specification               = {}
  elastic_gpu_specifications         = {}
  elastic_inference_accelerator      = {}
  enclave_options                    = {}
  instance_market_options            = {}
  license_specifications             = {}
  metadata_options                   = local.metadata_options
  enable_monitoring                  = true
  network_interfaces                 = []
  placement                          = {}
  maintenance_options                = {}
  private_dns_name_options           = {}

  # IAM role
  create_iam_role               = true
  iam_role_arn                  = null
  iam_role_name                 = null
  iam_role_use_name_prefix      = true
  iam_role_path                 = null
  iam_role_description          = "EKS managed node group IAM role"
  iam_role_permissions_boundary = null
  iam_role_tags                 = {}
  iam_role_attach_cni_policy    = true
  # To better understand why this `lookup()` logic is required, see:
  # https://github.com/hashicorp/terraform/issues/31646#issuecomment-1217279031
  iam_role_additional_policies = {}

  create_schedule = true
  schedules       = {}

  # Security group
  vpc_security_group_ids            = compact([local.node_security_group_id])
  cluster_primary_security_group_id = local.cluster_primary_security_group_id

  tags = {
    "k8s.io/cluster-autoscaler/enabled"               = "true"
    "k8s.io/cluster-autoscaler/${local.cluster_name}" = "owned"
  }
}