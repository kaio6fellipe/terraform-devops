variable "environment" {
  type = string
}

variable "ansible_instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "ansible_repository" {
  default = "kaio6fellipe/ansible-devops"
}

variable "amazon_linux_2" {}

variable "availability_zone_0" {}

variable "private_subnet_id_0" {}

variable "allow_bastion_ssh" {}

variable "allow_outbound" {}

variable "allow_ping" {}

variable "SSH_PRIVATE_KEY" {}

variable "region" {}