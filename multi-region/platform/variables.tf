variable "cdirs_acesso_remoto" {
  description = "Remote access CIDR for SGs in hosts associated with public subnets"
  # default     = ["0.0.0.0/0"]
  default     = [
    "168.196.72.0/22", #TurboNet
    "45.239.100.0/22", #TurboNet
    "170.233.164.0/22", #TurboNet
    "201.131.68.0/22", #TurboNet
    "131.255.68.0/22", #TurboNet
    "201.33.192.0/20", #VBTelecom
    "168.227.32.0/22", #VBTelecom
    "186.209.64.0/20", #Cligue
    "131.0.200.0/22", #Cligue
    "143.255.232.0/22", #Cligue
    "177.125.200.0/22", #Cligue
    "191.253.32.0/21", #Cligue
    "170.244.252.0/22", #Cligue
    "163.116.224.0/24", #Proxy
  ]
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

variable "vpc_private_subnets" {}

variable "vpc_public_subnets" {}

variable "availability_zone_0" {}

variable "private_subnet_id_0" {}

variable "availability_zone_1" {}

variable "private_subnet_id_1" {}

variable "availability_zone_2" {}

variable "private_subnet_id_2" {}

variable "public_subnet_id_0" {}

variable "public_subnet_id_1" {}

variable "public_subnet_id_2" {}

variable "private_subnet_cidr_block_0" {}

variable "database_subnet_id_0" {}

variable "db_subnet_group_name" {}

variable "vpc_cidr" {}

variable "SSH_PRIVATE_KEY" {
  sensitive = true
}

variable "region" {}

variable "private_dns_zone_name" {}

variable "private_dns_zone_id" {}

variable "AWS_RDS_PASSWORD" {
  sensitive = true
}

variable "ANSIBLE_VAULT_PASSWORD" {
  sensitive = true
}
