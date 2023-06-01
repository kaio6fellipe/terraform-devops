resource "aws_route53_record" "rds_private" {
  zone_id = local.private_dns_zone_id
  name    = "grafana-rds.${local.private_dns_zone_name}"
  type    = "CNAME"
  ttl     = "300"
  records = [module.grafana_rds.db_instance_address]
}
