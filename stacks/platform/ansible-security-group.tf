// Ansible Default Rule
resource "aws_security_group" "default_ansible" {
  #checkov:skip=CKV2_AWS_5: SG attached to all instances managed by Ansible Controller
  name        = "default_ansible_sg-${local.environment}"
  description = "Default SG for Ansible env: ${local.environment}"
  vpc_id      = var.vpc_id

  egress {
    description = "Permit all outbound traffic in env: ${local.environment}"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Permit inbound ping in env: ${local.environment}"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [local.vpc_cidr]
  }

  ingress {
    description     = "Permit inbound ssh from bastion host in env: ${local.environment}"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.default_bastion.id]
  }

  tags = {
    Name = "default_ansible_sg"
  }
}