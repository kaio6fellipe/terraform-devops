resource "aws_route53_record" "mimir_alb" {
  zone_id = var.private_dns_zone_id
  name    = "mimir-alb.${var.private_dns_zone_name}"
  type    = "CNAME"
  ttl     = "300"
  records = [module.alb.lb_dns_name]
}

resource "aws_route53_record" "mimir01_private" {
  zone_id = var.private_dns_zone_id
  name    = "mimir01.${var.private_dns_zone_name}"
  type    = "A"
  ttl     = "300"
  #checkov:skip=CKV2_AWS_23:Record attached to mimir private host created by ec2-module
  records = [module.ec2-instance01.private_ip]
}