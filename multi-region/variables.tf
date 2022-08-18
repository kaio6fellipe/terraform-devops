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

variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "private_subnet_a" {
  type = string
}

variable "public_subnet_a" {
  type = string
}

variable "private_subnet_b" {
  type = string
}

variable "public_subnet_b" {
  type = string
}

variable "private_subnet_c" {
  type = string
}

variable "public_subnet_c" {
  type = string
}

variable "SSH_PRIVATE_KEY" {
  description = "SSH Private Key for Ansible Server (Controller)"
  type = string
}