resource "aws_security_group" "default_platform" {
  #checkov:skip=CKV2_AWS_5: SG attached to All instances, except Ansible Controller and Bastion
  name        = "default_platform_sg-${local.globals.environment}"
  description = "Default SG for env: ${local.globals.environment}"
  vpc_id      = local.vpc_id

  egress {
    description = "Permit all outbound traffic in env: ${local.globals.environment}"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Permit inbound ping in env: ${local.globals.environment}"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [local.globals.vpc_cidr]
  }

  ingress {
    description     = "Permit inbound ssh from bastion host in env: ${local.globals.environment}"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.default_bastion.id]
  }

  ingress {
    description     = "Permit inbound ssh from ansible host in env: ${local.globals.environment}"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.default_ansible.id]
  }

  tags = {
    Name = "default_sg"
  }
}