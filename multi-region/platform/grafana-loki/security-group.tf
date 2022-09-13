resource "aws_security_group" "loki_http_instance" {
  name        = "loki_http_instance-${var.environment}"
  description = "loki_http_instance-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
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
  name        = "loki_cluster_instance-${var.environment}"
  description = "loki_cluster_instance-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 7946
    to_port     = 7946
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
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
  name        = "alb_loki_http-${var.environment}"
  description = "alb_loki_http-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
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
  name        = "alb_loki_https-${var.environment}"
  description = "alb_loki_https-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
  tags = {
    Name = "loki"
  }
}
