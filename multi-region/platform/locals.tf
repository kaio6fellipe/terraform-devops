locals {
  bastion_private_ipv4 = module.bastion.bastion_private_ipv4
  ansible_private_ipv4 = module.ansible_server.ansible_private_ipv4
}