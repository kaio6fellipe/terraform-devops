output "cdirs_acesso_remoto" {
  value = var.cdirs_acesso_remoto
}

output "cdirs_uptime_robot_monitoring" {
  value = var.cdirs_uptime_robot_monitoring
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
