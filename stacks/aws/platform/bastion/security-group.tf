resource "aws_security_group" "bastion_public_ssh" {
  #checkov:skip=CKV2_AWS_5: SG attached to bastion EC2 module
  #checkov:skip=CKV_AWS_277: Ingress allowed from 0.0.0.0 to only test ping response from host
  name        = "bastion_public_ssh-${local.globals.environment}"
  description = "Permit public ssh access on bastion in env: ${local.globals.environment}"
  vpc_id      = local.vpc_id

  ingress {
    description = "SSH public access on Bastion Host for remote access CIDRs"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = local.cidrs_remote_access
  }

  ingress {
    description = "Ping public access on Bastion Host for 0.0.0.0/0"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "bastion_uptimerobot_ssh" {
  #checkov:skip=CKV2_AWS_5: SG attached to bastion EC2 module
  name        = "bastion_uptimerobot_ssh-${local.globals.environment}"
  description = "Permit uptimerobot ssh monitoring on bastion in env: ${local.globals.environment}"
  vpc_id      = local.vpc_id

  ingress {
    description = "SSH Public access on uptime robot monitoring range"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = local.cidrs_uptime_robot_monitoring
  }
  tags = {
    Name = "uptime-robot"
  }
}

