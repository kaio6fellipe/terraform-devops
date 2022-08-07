resource "aws_security_group" "allow_bastion_ssh" {
  name        = "allow_bastion_ssh-${var.environment}"
  description = "allow_bastion_ssh-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${local.bastion_private_ipv4}/32"]
  }
  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "allow_ansible_admin_subnet_ssh" {
  name        = "allow_ansible_admin_subnet_ssh-${var.environment}"
  description = "allow_ansible_admin_subnet_ssh-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.private_subnet_id_0}/32"]
  }
  tags = {
    Name = "ssh"
  }
}
