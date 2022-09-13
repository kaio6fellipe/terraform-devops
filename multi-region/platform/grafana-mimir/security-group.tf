resource "aws_security_group" "mimir_http_instance" {
  name        = "mimir_http_instance-${var.environment}"
  description = "mimir_http_instance-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 9009
    to_port         = 9009
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_mimir_http.id, aws_security_group.sg_mimir_https.id]
  }
  tags = {
    Name = "mimir"
  }
}

resource "aws_security_group" "mimir_cluster_instance" {
  name        = "mimir_cluster_instance-${var.environment}"
  description = "mimir_cluster_instance-${var.environment}"
  vpc_id      = var.vpc_id

  # ingress {
  #   from_port   = 7946
  #   to_port     = 7946
  #   protocol    = "tcp"
  #   cidr_blocks = [var.vpc_cidr]
  # }

  ingress {
    from_port   = 9095
    to_port     = 9095
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
  
  tags = {
    Name = "mimir"
  }
}

resource "aws_security_group" "sg_mimir_http" {
  name        = "alb_mimir_http-${var.environment}"
  description = "alb_mimir_http-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
  tags = {
    Name = "mimir"
  }
}

resource "aws_security_group" "sg_mimir_https" {
  name        = "alb_mimir_https-${var.environment}"
  description = "alb_mimir_https-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
  tags = {
    Name = "mimir"
  }
}