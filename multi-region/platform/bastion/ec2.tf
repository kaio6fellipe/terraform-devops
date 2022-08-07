module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.1"

  name = "bastion01-${var.environment}"

  ami           = var.ubuntu2004_id
  instance_type = var.instance_type
  key_name      = var.key_name
  monitoring    = false

  availability_zone      = var.availability_zone_0
  subnet_id              = var.public_subnet_id_0
  vpc_security_group_ids = ["${aws_security_group.bastion_public_ssh.id}", "${var.allow_ansible_admin_subnet_ssh}", "${var.allow_outbound}", "${var.allow_ping}"]

  user_data = <<EOF
#!/bin/bash
echo "Copying the SSH Key to Bastion server"

echo "Changing Hostname"
hostname "bastion01-${var.environment}"
echo "bastion01-${var.environment}" > /etc/hostname
EOF

  tags = {
    Type = var.instance_type
    App  = "bastion"
  }
}
