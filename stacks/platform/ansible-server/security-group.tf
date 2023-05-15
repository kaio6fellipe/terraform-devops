resource "aws_security_group" "egress_ping" {
  #checkov:skip=CKV2_AWS_5: SG attached to Ansible EC2 Module
  name        = "ansible_egress_ping-${local.environment}"
  description = "Permit egress ping outbound to ansible in env: ${local.environment}"
  vpc_id      = local.vpc_id

  egress {
    description = "Allow ICMP in egress just to attach this rule to default ingress in others instances"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ping"
  }
}
