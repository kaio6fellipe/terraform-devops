resource "aws_route53_record" "ansible_private" {
  zone_id = var.private_dns_zone_id
  name = "ansible.${var.private_dns_zone_name}"
  type = "A"
  ttl = "300"
  records = [module.ec2-instance.private_ip]
}