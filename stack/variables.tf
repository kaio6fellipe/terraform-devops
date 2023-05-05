variable "key_name" {
  description = "Key name prefix"
  default     = "terraform-aws"
}

variable "environment" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ansible_instance_type" {
  type = string
}

variable "db_instance_type" {
  type = string
}

variable "rds_allocated_storage" {}

variable "rds_max_allocated_storage" {}

variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "private_subnet_a" {
  type = string
}

variable "public_subnet_a" {
  type = string
}

variable "private_subnet_b" {
  type = string
}

variable "intra_subnet_a" {
  type = string
}

variable "intra_subnet_b" {
  type = string
}

variable "intra_subnet_c" {
  type = string
}

variable "public_subnet_b" {
  type = string
}

variable "private_subnet_c" {
  type = string
}

variable "public_subnet_c" {
  type = string
}

variable "database_subnet_a" {
  type = string
}

variable "database_subnet_b" {
  type = string
}

variable "database_subnet_c" {
  type = string
}

variable "platform_eks_services" {
  type = string
}

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
  sensitive = true
}

variable "ADMIN_USER_NAME" {
  sensitive = true
}

variable "ARGO_GITHUB_SSO_SECRET_KEY" {
  sensitive = true
}

variable "GITHUB_ACTIONS_CIDR" {}
