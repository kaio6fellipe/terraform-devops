resource "aws_security_group" "bastion_public_ssh" {
  #checkov:skip=CKV2_AWS_5: SG attached to bastion EC2 module
  name        = "bastion_public_ssh-${var.environment}"
  description = "Permit public ssh access on bastion in env: ${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow ICMP in egress just to attach this rule to default ingress in others instances"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto
  }
  tags = {
    Name = "ssh"
  }
}
