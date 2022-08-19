resource "aws_security_group" "bastion_public_ssh" {
  name        = "bastion_public_ssh-${var.environment}"
  description = "bastion_public_ssh-${var.environment}"
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
