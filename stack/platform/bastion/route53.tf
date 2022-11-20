resource "aws_route53_record" "bastion_public" {
  zone_id = var.public_dns_zone_id
  name = "bastion-${var.environment}.${var.public_dns_zone_name}"
  type = "A"
  ttl = "300"
  #checkov:skip=CKV2_AWS_23:Record attached to a bastion host created by ec2-module
  records = [module.ec2-instance.public_ip]
}

resource "aws_route53_record" "bastion_private" {
  zone_id = var.private_dns_zone_id
  name = "bastion.${var.private_dns_zone_name}"
  type = "A"
  ttl = "300"
  #checkov:skip=CKV2_AWS_23:Record attached to a bastion host created by ec2-module
  records = [module.ec2-instance.private_ip]
}