resource "aws_security_group" "default" {
  name        = "default_sg-${var.environment}"
  description = "Default SG for env: ${var.environment}"
  vpc_id      = var.vpc_id

  tags = {
    Name = "default_sg"
  }
}

resource "aws_security_group_rule" "default_egress" {
  description       = "Permit all outbound traffic in env: ${var.environment}"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default.id
}

resource "aws_security_group_rule" "allow_ping" {
  description       = "Permit inbound ping in env: ${var.environment}"
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["${var.vpc_cidr}"]
  security_group_id = aws_security_group.default.id
}

resource "aws_security_group_rule" "allow_bastion_ssh" {
  description              = "Permit inbound ssh from bastion host in env: ${var.environment}"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = aws_security_group.default.id
}

resource "aws_security_group_rule" "allow_ansible_ssh" {
  description              = "Permit inbound ssh from ansible host in env: ${var.environment}"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.ansible_sg_id
  security_group_id        = aws_security_group.default.id
}

// Ansible Default Rule
resource "aws_security_group" "default_ansible" {
  name        = "default_ansible_sg-${var.environment}"
  description = "Default SG for Ansible env: ${var.environment}"
  vpc_id      = var.vpc_id

  tags = {
    Name = "default_ansible_sg"
  }
}

resource "aws_security_group_rule" "default_ansible_egress" {
  description       = "Permit all outbound traffic in env: ${var.environment}"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default_ansible.id
}

resource "aws_security_group_rule" "allow_ansible_ping" {
  description       = "Permit inbound ping in env: ${var.environment}"
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["${var.vpc_cidr}"]
  security_group_id = aws_security_group.default_ansible.id
}

resource "aws_security_group_rule" "allow_bastion_ansible_ssh" {
  description              = "Permit inbound ssh from bastion host in env: ${var.environment}"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = aws_security_group.default_ansible.id
}

// Bastion Default Rule
resource "aws_security_group" "default_bastion" {
  name        = "default_bastion_sg-${var.environment}"
  description = "Default SG for Bastion in env: ${var.environment}"
  vpc_id      = var.vpc_id

  tags = {
    Name = "default_bastion_sg"
  }
}

resource "aws_security_group_rule" "default_bastion_egress" {
  description       = "Permit all outbound traffic in env: ${var.environment}"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default.id
}

resource "aws_security_group_rule" "allow_bastion_ping" {
  description       = "Permit inbound ping in env: ${var.environment}"
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["${var.vpc_cidr}"]
  security_group_id = aws_security_group.default.id
}

resource "aws_security_group_rule" "allow_ansible_bastion_ssh" {
  description              = "Permit inbound ssh from ansible host in env: ${var.environment}"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.ansible_sg_id
  security_group_id        = aws_security_group.default.id
}