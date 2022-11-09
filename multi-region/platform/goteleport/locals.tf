locals {
  cluster_name                    = "teleport-${var.environment}"
  route53_domain                  = "teleport-${var.environment}.${var.route53_zone}"
  s3_bucket_name                  = "teleport-certificates-ktech-br-${var.environment}"
  allowed_ssh_ingress_cidr_blocks = var.cdirs_acesso_remoto
  allowed_ingress_cidr_blocks     = var.cdirs_acesso_remoto
  allowed_egress_cidr_blocks      = ["0.0.0.0/0"]
}
