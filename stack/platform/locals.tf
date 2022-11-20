locals {
  bastion_private_ipv4 = module.bastion.bastion_private_ipv4
  ansible_private_ipv4 = module.ansible_server.ansible_private_ipv4
  bastion_sg_id = module.bastion.bastion_sg_id
  ansible_sg_id = module.ansible_server.ansible_sg_id
}