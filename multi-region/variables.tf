variable "cdirs_acesso_remoto" {
  default = ["201.33.199.59/32"]
}

variable "key_name" {
  default = "terraform-aws"
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