resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh-${var.environment}"
  description = "acesso-ssh-${var.environment}"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "${var.cdirs_acesso_remoto}"
  }
  tags = {
    Name = "ssh"
    Env = var.environment
  }
}
