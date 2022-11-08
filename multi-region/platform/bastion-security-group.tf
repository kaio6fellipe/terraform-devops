// Bastion Default Rule
resource "aws_security_group" "default_bastion" {
  name        = "default_bastion_sg-${var.environment}"
  description = "Default SG for Bastion in env: ${var.environment}"
  vpc_id      = var.vpc_id

  egress {
    description = "Permit all outbound traffic in env: ${var.environment}"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Permit inbound ping in env: ${var.environment}"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  ingress {
    description     = "Permit inbound ssh from ansible host in env: ${var.environment}"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [local.ansible_sg_id]
  }

  tags = {
    Name = "default_bastion_sg"
  }
}