variable "SSH_PRIVATE_KEY" {
  description = "SSH Private Key for Ansible Server (Controller)"
  type        = string
  sensitive   = true
}

variable "AWS_RDS_PASSWORD" {
  description = "AWS RDS generic root password"
  type        = string
  sensitive   = true
}

variable "ANSIBLE_VAULT_PASSWORD" {
  description = "Ansible vault root password"
  type        = string
  sensitive   = true
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

variable "GITHUB_ACTIONS_CIDR" {
  description = "GitHub Actions egress CIDR Block"
  default     = ["0.0.0.0/0"]
  type        = list(string)
}

variable "ARGO_GITHUB_SSO_SECRET_KEY" {
  description = "GitHub SSO for ArgoCD Application "
  type        = string
  sensitive   = true
}

variable "CROSSPLANE_AWS_CREDENTIALS_CONTENT" {
  description = "Crossplane AWS Credentials content file"
  type        = string
  sensitive   = true
}
