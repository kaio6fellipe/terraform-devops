resource "aws_security_group" "bastion_public_ssh" {
  #checkov:skip=CKV2_AWS_5: SG attached to bastion EC2 module
  name        = "bastion_public_ssh-${local.environment}"
  description = "Permit public ssh access on bastion in env: ${local.environment}"
  vpc_id      = local.vpc_id

  ingress {
    description = "Allow ICMP in egress just to attach this rule to default ingress in others instances"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = local.cidrs_remote_access
  }
  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "bastion_uptimerobot_ssh" {
  #checkov:skip=CKV2_AWS_5: SG attached to bastion EC2 module
  name        = "bastion_uptimerobot_ssh-${local.environment}"
  description = "Permit uptimerobot ssh monitoring on bastion in env: ${local.environment}"
  vpc_id      = local.vpc_id

  ingress {
    description = "Allow ICMP in egress just to attach this rule to default ingress in others instances"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = local.cidrs_uptime_robot_monitoring
  }
  tags = {
    Name = "uptime-robot"
  }
}

