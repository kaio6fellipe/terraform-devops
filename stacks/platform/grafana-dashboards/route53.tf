resource "aws_route53_record" "grafana_public" {
  zone_id = var.public_dns_zone_id
  name    = "grafana-${var.environment}.${var.public_dns_zone_name}"
  type    = "CNAME"
  ttl     = "300"
  records = [module.alb.lb_dns_name]
}

resource "aws_route53_record" "grafana_private" {
  zone_id = var.private_dns_zone_id
  name    = "grafana.${var.private_dns_zone_name}"
  type    = "A"
  ttl     = "300"
  #checkov:skip=CKV2_AWS_23:Record attached to grafana host created by ec2-module
  records = [module.ec2-instance.private_ip]
}

resource "aws_route53_record" "rds_private" {
  zone_id = var.private_dns_zone_id
  name    = "grafana-rds.${var.private_dns_zone_name}"
  type    = "CNAME"
  ttl     = "300"
  records = [module.grafana_rds.db_instance_address]
}