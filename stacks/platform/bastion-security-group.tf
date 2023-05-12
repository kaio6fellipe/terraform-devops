// Bastion Default Rule
resource "aws_security_group" "default_bastion" {
  #checkov:skip=CKV2_AWS_5: SG attached to all instances managed by Bastion
  name        = "default_bastion_sg-${local.environment}"
  description = "Default SG for Bastion in env: ${local.environment}"
  vpc_id      = local.vpc_id

  tags = {
    Name = "default_bastion_sg"
  }
}

resource "aws_security_group_rule" "bastion_egress" {
  type              = "egress"
  description       = "Permit all outbound traffic in env: ${local.environment}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default_bastion.id
}

resource "aws_security_group_rule" "bastion_ingress" {
  type              = "ingress"
  description       = "Permit inbound ping in env: ${local.environment}"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = [local.vpc_cidr]
  security_group_id = aws_security_group.default_bastion.id
}

resource "aws_security_group_rule" "ansible_to_bastion_ssh" {
  type                     = "ingress"
  description              = "Permit inbound ssh from ansible host in env: ${local.environment}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.default_ansible.id
  security_group_id        = aws_security_group.default_bastion.id
}
