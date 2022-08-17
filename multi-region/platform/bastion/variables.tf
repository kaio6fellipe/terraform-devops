variable "cdirs_acesso_remoto" {
  default = ["201.33.195.0/24", "201.33.205.0/24"]
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

variable "amazon_linux_2" {}

variable "vpc_id" {}

variable "availability_zone_0" {}

variable "public_subnet_id_0" {}

variable "allow_ansible_admin_subnet_ssh" {}

variable "allow_outbound" {}

variable "allow_ping" {}

variable "SSH_PRIVATE_KEY" {}
