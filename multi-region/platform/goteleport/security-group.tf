resource "aws_security_group" "goteleport_public_https" {
  name        = "goteleport_public_https-${var.environment}"
  description = "goteleport_public_https-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto
  }
  tags = {
    Name = "https"
  }
}
