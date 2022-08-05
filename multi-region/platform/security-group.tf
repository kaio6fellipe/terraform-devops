resource "aws_security_group" "allow_bastion_ssh" {
  name        = "allow_bastion_ssh-${var.environment}"
  description = "allow_bastion_ssh-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${module.bastion.bastion_private_ipv4}/32"]
  }
  tags = {
    Name = "ssh"
    Env  = var.environment
  }
}
