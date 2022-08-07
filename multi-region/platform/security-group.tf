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
    cidr_blocks = ["${var.private_subnet_cidr_block_0}"]
  }
  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "allow_outbound" {
  name        = "allow_outbound-${var.environment}"
  description = "allow_outbound-${var.environment}"
  vpc_id      = var.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "outbound"
  }
}

resource "aws_security_group" "allow_ping" {
  name        = "allow_ping-${var.environment}"
  description = "allow_ping-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    from_port = -1
    to_port   = -1
    protocol = "icmp"
    cidr_blocks = ["${var.vpc_cidr}"]
  }
  tags = {
    Name = "ping"
  }
}
