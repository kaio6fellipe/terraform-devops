resource "aws_route53_record" "loki_alb" {
  zone_id = var.private_dns_zone_id
  name    = "loki-alb.${var.private_dns_zone_name}"
  type    = "CNAME"
  ttl     = "300"
  records = [module.alb.lb_dns_name]
}

resource "aws_route53_record" "loki01_private" {
  zone_id = var.private_dns_zone_id
  name    = "loki01.${var.private_dns_zone_name}"
  type    = "A"
  ttl     = "300"
  #checkov:skip=CKV2_AWS_23:This record is attached to loki ec2 instances from ec2-modules
  records = [module.ec2-instance01.private_ip]
}

resource "aws_route53_record" "loki02_private" {
  zone_id = var.private_dns_zone_id
  name    = "loki02.${var.private_dns_zone_name}"
  type    = "A"
  ttl     = "300"
  #checkov:skip=CKV2_AWS_23:This record is attached to loki ec2 instances from ec2-modules
  records = [module.ec2-instance02.private_ip]
}

resource "aws_route53_record" "loki_gossip_ring" {
  zone_id = var.private_dns_zone_id
  name    = "loki-gossip-ring.${var.private_dns_zone_name}"
  type    = "A"
  ttl     = "300"
  #checkov:skip=CKV2_AWS_23:This record is attached to loki ec2 instances from ec2-modules
  records = [module.ec2-instance01.private_ip, module.ec2-instance02.private_ip]
}
