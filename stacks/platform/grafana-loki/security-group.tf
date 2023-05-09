resource "aws_security_group" "loki_http_instance" {
  #checkov:skip=CKV2_AWS_5: SG attached to Grafana Loki EC2 Module
  name        = "loki_http_instance-${var.environment}"
  description = "loki_http_instance-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow requests to port 3100 from Grafana Loki Load Balancer"
    from_port       = 3100
    to_port         = 3100
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_loki_http.id, aws_security_group.sg_loki_https.id]
  }
  tags = {
    Name = "loki"
  }
}

resource "aws_security_group" "loki_cluster_instance" {
  #checkov:skip=CKV2_AWS_5: SG attached to Loki EC2 Module
  name        = "loki_cluster_instance-${var.environment}"
  description = "loki_cluster_instance-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow connections for cluster bind port for Loki Gossip Ring"
    from_port   = 7946
    to_port     = 7946
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
    description = "Allow connections to gRPC server"
    from_port   = 9095
    to_port     = 9095
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  tags = {
    Name = "loki"
  }
}

resource "aws_security_group" "sg_loki_http" {
  #checkov:skip=CKV2_AWS_5: SG attached to Grafana Loki ALB Module
  name        = "alb_loki_http-${var.environment}"
  description = "alb_loki_http-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP connection in Loki ALB from VPC CIDR block"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
  tags = {
    Name = "loki"
  }
}

resource "aws_security_group" "sg_loki_https" {
  #checkov:skip=CKV2_AWS_5: SG attached to Grafana Loki ALB Module
  name        = "alb_loki_https-${var.environment}"
  description = "alb_loki_https-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTPS connection in Loki ALB from VPC CIDR block"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
  tags = {
    Name = "loki"
  }
}
