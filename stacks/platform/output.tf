output "cidrs_remote_access" {
  value = var.cidrs_remote_access
}

output "cidrs_uptime_robot_monitoring" {
  value = var.cidrs_uptime_robot_monitoring
}

output "public_dns_zone_name" {
  value = data.aws_route53_zone.ktech_public.name
}

output "public_dns_zone_id" {
  value = data.aws_route53_zone.ktech_public.zone_id
}

output "amazon_linux_2" {
  value = data.aws_ami.amazon_linux_2.id
}

output "bastion_default_sg" {
  value = aws_security_group.default_bastion.id
}