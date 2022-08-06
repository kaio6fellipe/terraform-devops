output "ansible_private_ipv4" {
  value = module.ec2-instance.private_ip
}