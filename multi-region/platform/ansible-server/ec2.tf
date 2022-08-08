module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.1"

  name = "ansible-server01-${var.environment}"

  ami           = var.ubuntu2004_id
  instance_type = var.ansible_instance_type
  key_name      = var.key_name
  monitoring    = false

  availability_zone      = var.availability_zone_0
  subnet_id              = var.private_subnet_id_0
  vpc_security_group_ids = ["${var.allow_bastion_ssh}", "${var.allow_outbound}", "${var.allow_ping}"]

  user_data = <<EOF
#!/bin/bash
echo "Copying the SSH Key to Ansible server" >> /var/log/terraform.log
echo "${var.SSH_PRIVATE_KEY}" > /home/ubuntu/.ssh/"terraform-aws-${var.environment}"

echo "Changing permissions of the SSH Key" >> /var/log/terraform.log
sudo chmod 400 /home/ubuntu/.ssh/"terraform-aws-${var.environment}

echo "Changing Hostname" >> /var/log/terraform.log
hostname "ansible-server01-${var.environment}"
echo "ansible-server01-${var.environment}" > /etc/hostname
EOF

  tags = {
    Type = var.ansible_instance_type
    App  = "ansible"
  }
}
