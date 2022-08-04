output "bastion_public_ipv4" {
  value = module.ec2-instance.public_ip
}

output "bastion_private_ipv4" {
  value = module.ec2-instance.private_ip
}