resource "aws_route53_record" "grafana_public" {
  zone_id = var.public_dns_zone_id
  name = "grafana.${var.environment}.${var.public_dns_zone_name}"
  type = "CNAME"
  ttl = "300"
  records = [module.alb.lb_dns_name]
}

resource "aws_route53_record" "grafana_private" {
  zone_id = var.private_dns_zone_id
  name = "grafana.${var.private_dns_zone_name}"
  type = "A"
  ttl = "300"
  records = [module.ec2-instance.private_ip]
}