variable "environment" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ansible_instance_type" {
  type = string
}

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

variable "vpc_cidr" {}

variable "SSH_PRIVATE_KEY" {}

variable "region" {}
