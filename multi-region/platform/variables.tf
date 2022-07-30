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
    type = string
}

variable "sg_ssh" {}

variable "ubuntu2004_id" {}

variable "availability_zone_0" {}

variable "private_subnet_id_0" {}

variable "public_subnet_id_0" {}