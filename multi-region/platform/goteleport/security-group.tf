resource "aws_security_group" "goteleport_public_ssh" {
  name        = "goteleport_public_ssh-${var.environment}"
  description = "goteleport_public_ssh-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto
  }
  tags = {
    Name = "ssh"
  }
}
