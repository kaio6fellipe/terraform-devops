variable "environment" {}

variable "vpc_id" {}

variable "vpc_cidr" {}

variable "vpc_private_subnets" {}

variable "vpc_public_subnets" {}

variable "region" {}

variable "availability_zones" {}

variable "namespace" {
  default = "eg"
}

variable "stage" {
  default = "test"
}

variable "name" {
  default = "platform-eks"
}

# When updating the Kubernetes version, also update the API and client-go version in test/src/go.mod
variable "kubernetes_version" {
  default = "1.24"
}

variable "oidc_provider_enabled" {
  default = true
}

variable "local_exec_interpreter" {
  type        = list(string)
  default     = ["/bin/sh", "-c"]
  description = "shell to use for local_exec"
}

variable "enabled_cluster_log_types" {
  default = ["audit"]
}

variable "cluster_log_retention_period" {
  default = 7
}

variable "map_additional_aws_accounts" {
  description = "Additional AWS account numbers to add to `config-map-aws-auth` ConfigMap"
  type        = list(string)
  default     = []
}

variable "map_additional_iam_roles" {
  description = "Additional IAM roles to add to `config-map-aws-auth` ConfigMap"

  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = []
}

variable "map_additional_iam_users" {
  description = "Additional IAM users to add to `config-map-aws-auth` ConfigMap"

  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = []
}

variable "instance_types" {
  default = ["t3.small"]
}

variable "desired_size" {
  default = 2
}

variable "max_size" {
  default = 3
}

variable "min_size" {
  default = 2
}

variable "kubernetes_labels" {
  default = {}
}

variable "cluster_encryption_config_enabled" {
  default = true
}

variable "cluster_encryption_config_kms_key_id" {
  type        = string
  default     = ""
  description = "KMS Key ID to use for cluster encryption config"
}

variable "cluster_encryption_config_kms_key_enable_key_rotation" {
  type        = bool
  default     = true
  description = "Cluster Encryption Config KMS Key Resource argument - enable kms key rotation"
}

variable "cluster_encryption_config_kms_key_deletion_window_in_days" {
  type        = number
  default     = 10
  description = "Cluster Encryption Config KMS Key Resource argument - key deletion windows in days post destruction"
}

variable "cluster_encryption_config_kms_key_policy" {
  type        = string
  default     = null
  description = "Cluster Encryption Config KMS Key Resource argument - key policy"
}

variable "cluster_encryption_config_resources" {
  type        = list(any)
  default     = ["secrets"]
  description = "Cluster Encryption Config Resources to encrypt, e.g. ['secrets']"
}

variable "addons" {
  default = [
    {
      addon_name               = "vpc-cni"
      addon_version            = null
      resolve_conflicts        = "NONE"
      service_account_role_arn = null
    }
  ]
}

variable "apply_config_map_aws_auth" {
  type        = bool
  default     = true
  description = "Whether to apply the ConfigMap to allow worker nodes to join the EKS cluster and allow additional users, accounts and roles to acces the cluster"
}