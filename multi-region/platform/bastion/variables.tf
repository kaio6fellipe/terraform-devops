variable "cdirs_acesso_remoto" {
  default = ["192.12.115.207/32", "201.33.205.131/32"]
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

variable "allow_ansible_admin_ssh" {}