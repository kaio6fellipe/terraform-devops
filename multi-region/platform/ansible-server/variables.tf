variable "environment" {
  type = string
}

variable "ansible_instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "vpc_id" {}

variable "ansible_repository" {
  default = "kaio6fellipe/ansible-devops"
}

variable "amazon_linux_2" {}

variable "availability_zone_0" {}

variable "private_subnet_id_0" {}

variable "default_sg" {}

variable "SSH_PRIVATE_KEY" {
  sensitive = true
}

variable "region" {}

variable "private_dns_zone_name" {}

variable "private_dns_zone_id" {}

variable "ANSIBLE_VAULT_PASSWORD" {
  sensitive = true
}