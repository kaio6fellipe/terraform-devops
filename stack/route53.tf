module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "2.9.0"

  zones = {
    "${local.environment}.private.ktech-br.com" = {
      comment = "${local.environment}.private.ktech-br.com (Private zone for env: ${local.environment})"
      vpc = [
        {
          vpc_id = module.vpc.vpc_id
        }
      ]
      tags = {
        Name = "${local.environment}.private.ktech-br.com"
      }
    }
  }
}