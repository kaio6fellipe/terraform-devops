resource "aws_security_group" "grafana_http" {
  name        = "grafana_http-${var.environment}"
  description = "grafana_http-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto
  }
  tags = {
    Name = "grafana-dashboards"
  }
}

module "sg_grafana_db" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.0"

  name        = "grafana_db-${var.environment}"
  description = "grafana_db-${var.environment}"
  vpc_id      = var.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "PostgreSQL access from within VPC"
      cidr_blocks = "${module.ec2-instance.private_ip}/32"
    },
  ]
}
