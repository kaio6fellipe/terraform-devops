resource "aws_security_group" "egress_ping" {
  name        = "ansible_egress_ping-${var.environment}"
  description = "Permit egress ping outbound to ansible in env: ${var.environment}"
  vpc_id      = var.vpc_id

  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ping"
  }
}
