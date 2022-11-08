output "ansible_private_ipv4" {
  value = module.ec2-instance.private_ip
}

output "ansible_sg_id" {
  value = aws_security_group.egress_ping.id
}