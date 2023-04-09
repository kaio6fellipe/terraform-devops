variable "environment" {}

variable "vpc_id" {}

variable "vpc_cidr" {}

variable "vpc_private_subnets" {}

variable "vpc_public_subnets" {}

variable "region" {}

variable "availability_zones" {}

variable "key_name" {}

variable "default_sg" {}

variable "cdirs_acesso_remoto" {}

variable "GITHUB_ACTIONS_CIDR" {}

variable "ADMIN_USER_ARN" {
  sensitive = true
}

variable "ADMIN_USER_NAME" {
  sensitive = true
}

variable "name" {
  default = "platform-eks"
}

# When updating the Kubernetes version, also update the API and client-go version in test/src/go.mod
variable "kubernetes_version" {
  default = "1.24"
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
