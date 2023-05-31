variable "ansible_repository" {
  type    = string
  default = "kaio6fellipe/ansible-devops"
}

variable "SSH_PRIVATE_KEY" {
  description = "SSH Private Key for Ansible Server (Controller)"
  type        = string
  sensitive   = true
}

variable "ANSIBLE_VAULT_PASSWORD" {
  description = "Ansible vault root password"
  type        = string
  sensitive   = true
}
