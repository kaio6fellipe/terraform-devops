// Ansible Default Rule
resource "aws_security_group" "default_ansible" {
  #checkov:skip=CKV2_AWS_5: SG attached to all instances managed by Ansible Controller
  name        = "default_ansible_sg-${local.environment}"
  description = "Default SG for Ansible env: ${local.environment}"
  vpc_id      = local.vpc_id

  tags = {
    Name = "default_ansible_sg"
  }
}

resource "aws_security_group_rule" "ansible_egress" {
  type              = "egress"
  description       = "Permit all outbound traffic in env: ${local.environment}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default_ansible.id
}

resource "aws_security_group_rule" "ansible_ingress" {
  type              = "ingress"
  description       = "Permit inbound ping in env: ${local.environment}"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = [local.vpc_cidr]
  security_group_id = aws_security_group.default_ansible.id
}

resource "aws_security_group_rule" "bastion_to_ansible_ssh" {
  type                     = "ingress"
  description              = "Permit inbound ssh from bastion host in env: ${local.environment}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.default_bastion.id
  security_group_id        = aws_security_group.default_ansible.id
}
