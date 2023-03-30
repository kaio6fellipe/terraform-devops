variable "environment" {}

variable "vpc_id" {}

variable "vpc_cidr" {}

variable "vpc_private_subnets" {}

variable "vpc_public_subnets" {}

variable "region" {}

variable "availability_zones" {}

variable "key_name" {}

variable "default_sg" {}

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
