variable "cdirs_acesso_remoto" {
  description = "Remote access CIDR for SGs in hosts associated with public subnets"
  default = ["201.33.195.0/24", "201.33.205.0/24"]
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

variable "key_name" {
  description = "Key name prefix"
  type        = string
}

variable "amazon_linux_2" {}

variable "vpc_id" {}

variable "availability_zone_0" {}

variable "private_subnet_id_0" {}

variable "public_subnet_id_0" {}

variable "private_subnet_cidr_block_0" {}

variable "database_subnet_id_0" {}

variable "db_subnet_group_name" {}

variable "vpc_cidr" {}

variable "SSH_PRIVATE_KEY" {}

variable "region" {}
