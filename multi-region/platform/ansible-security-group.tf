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