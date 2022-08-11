module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.1"

  name = "bastion01-${var.environment}"

  ami           = var.amazon_linux_2
  instance_type = var.instance_type
  key_name      = var.key_name
  monitoring    = false

  availability_zone      = var.availability_zone_0
  subnet_id              = var.public_subnet_id_0
  vpc_security_group_ids = ["${aws_security_group.bastion_public_ssh.id}", "${var.allow_ansible_admin_subnet_ssh}", "${var.allow_outbound}", "${var.allow_ping}"]

  user_data = <<EOF
#!/bin/bash
sudo echo "$(date '+%d%m%Y_%Hh%M') - Changing Hostname o Bastion Server" >> /var/log/terraform.log
sudo hostname "bastion01-${var.environment}"
sudo echo "bastion01-${var.environment}" > /etc/hostname

sudo echo "$(date '+%d%m%Y_%Hh%M') - Running updates with apt update and upgrade" >> /var/log/terraform.log
sudo yum update -y
sudo yum upgrade -y

sudo echo "$(date '+%d%m%Y_%Hh%M') - Copying the SSH Key to Bastion server" >> /var/log/terraform.log
sudo echo "${var.SSH_PRIVATE_KEY}" > /home/ec2-user/.ssh/"terraform-aws-${var.environment}"
sudo chown ec2-user:root /home/ec2-user/.ssh/"terraform-aws-${var.environment}"

sudo echo "$(date '+%d%m%Y_%Hh%M') - Changing permissions of the SSH Key" >> /var/log/terraform.log
sudo chmod 400 /home/ec2-user/.ssh/"terraform-aws-${var.environment}"
EOF

  tags = {
    Type = var.instance_type
    App  = "bastion"
  }
}
