resource "aws_security_group" "grafana_http_instance" {
  #checkov:skip=CKV2_AWS_5: SG attached to Grafana EC2 Module
  name        = "grafana_http_instance-${var.environment}"
  description = "grafana_http_instance-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow requests to port 3000 from Grafana Load Balancer"
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_grafana_http.id, aws_security_group.sg_grafana_https.id]
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

resource "aws_security_group" "sg_grafana_http" {
  #checkov:skip=CKV2_AWS_5: SG attached to Grafana ALB Module
  #checkov:skip=CKV_AWS_260: SG used to redirect to port 443
  name        = "alb_grafana_http-${var.environment}"
  description = "alb_grafana_http-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP access to Grafana ALB from allowed CIDR blocks"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto
  }
  tags = {
    Name = "grafana-dashboards"
  }
}

resource "aws_security_group" "sg_grafana_https" {
  #checkov:skip=CKV2_AWS_5: SG attached to Grafana ALB Module
  name        = "alb_grafana_https-${var.environment}"
  description = "alb_grafana_https-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTPS access to Grafana ALB from allowed CIDR blocks"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto
  }
  tags = {
    Name = "grafana-dashboards"
  }
}
