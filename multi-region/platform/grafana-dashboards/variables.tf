variable "environment" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "db_instance_type" {
  type = string
}

variable "rds_allocated_storage" {}

variable "rds_max_allocated_storage" {}

variable "key_name" {
  type = string
}

variable "amazon_linux_2" {}

variable "vpc_id" {}

variable "vpc_cidr" {}

variable "availability_zone_1" {}

variable "private_subnet_id_1" {}

variable "availability_zone_2" {}

variable "private_subnet_id_2" {}

variable "public_subnet_id_1" {}

variable "public_subnet_id_2" {}

variable "database_subnet_id_0" {}

variable "db_subnet_group_name" {}

variable "default_sg" {}

variable "cdirs_acesso_remoto" {
  type = list(any)
}

variable "private_dns_zone_name" {}

variable "private_dns_zone_id" {}

variable "public_dns_zone_name" {}

variable "public_dns_zone_id" {}

variable "AWS_RDS_PASSWORD" {
  type      = string
  sensitive = true
}
