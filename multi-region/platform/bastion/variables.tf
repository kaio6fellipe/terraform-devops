variable "cdirs_acesso_remoto" {
  default = ["179.191.119.178/32"]
}

variable "environment" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "ubuntu2004_id" {}

variable "vpc_id" {}

variable "availability_zone_0" {}

variable "public_subnet_id_0" {}

variable "allow_ansible_admin_subnet_ssh" {}

variable "allow_outbound" {}

variable "allow_ping" {}