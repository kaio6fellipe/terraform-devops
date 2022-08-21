variable "environment" {
  description = "The environment variable passed to all the modules"
  type        = string
}

variable "instance_type" {
  description = "The default instance type to use in all the instances"
  type        = string
}

variable "ansible_instance_type" {
  description = "An instance type to the Ansible Server (Controller)"
  type        = string
}

variable "db_instance_type" {
  description = "The default instance type to use in all RDS instances"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "private_subnet_a" {
  description = "Private Subnet in AZ (a)"
  type        = string
}

variable "public_subnet_a" {
  description = "Public Subnet in AZ (a)"
  type        = string
}

variable "private_subnet_b" {
  description = "Private Subnet in AZ (b)"
  type        = string
}

variable "public_subnet_b" {
  description = "Public Subnet in AZ (a)"
  type        = string
}

variable "private_subnet_c" {
  description = "Private Subnet in AZ (c)"
  type        = string
}

variable "public_subnet_c" {
  description = "Public Subnet in AZ (c)"
  type        = string
}

variable "database_subnet_a" {
  description = "Database subnet in AZ (a)"
  type        = string
}

variable "database_subnet_b" {
  description = "Database subnet in AZ (b)"
  type        = string
}

variable "database_subnet_c" {
  description = "Database subnet in AZ (c)"
  type        = string
}

variable "SSH_PRIVATE_KEY" {
  description = "SSH Private Key for Ansible Server (Controller)"
  type        = string
}
