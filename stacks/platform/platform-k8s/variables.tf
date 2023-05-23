variable "GITHUB_ACTIONS_CIDR" {
  description = "GitHub Actions egress CIDR Block"
  default     = ["0.0.0.0/0"]
  type        = list(string)
}

variable "ADMIN_USER_ARN" {
  description = "EKS admin user ARN"
  type        = string
  sensitive   = true
}

variable "ADMIN_USER_NAME" {
  description = "EKS admin user name"
  type        = string
  sensitive   = true
}

variable "name" {
  default = "platform-eks"
  type    = string
}

# When updating the Kubernetes version, also update the API and client-go version in test/src/go.mod
variable "kubernetes_version" {
  default = "1.25"
  type    = string
}

variable "instance_types" {
  # default = ["t3.small", "t3.medium", "c6i.xlarge"]
  default = [
    "t3.small",  # 11 pods
    "t3.medium", # 17 pods
    "t3.xlarge", # 58 pods
  ]
  type = list(string)
}

variable "desired_size" {
  default = 4
  type    = number
}

variable "max_size" {
  default = 20
  type    = number
}

variable "min_size" {
  default = 3
  type    = number
}
