# data "aws_availability_zones" "az_zones" {
#   all_availability_zones = true
# }

data "aws_route53_zone" "private_zone" {
  name         = "${local.globals.environment}.private.ktech-br.com"
  private_zone = true
  depends_on   = [module.zones.route53_zone_zone_id]
}

data "aws_route53_zone" "ktech_devops_private_zone" {
  name         = "ktech-devops.com.br"
  private_zone = true
  depends_on   = [module.zones.route53_zone_zone_id]
}
