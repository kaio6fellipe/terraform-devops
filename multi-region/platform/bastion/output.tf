output "bastion_public_ipv4" {
  value = "${module.ec2-instance.public_ip}"
}