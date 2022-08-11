module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.1"

  name = "ansible-server01-${var.environment}"

  ami           = var.amazon_linux_2
  instance_type = var.ansible_instance_type
  key_name      = var.key_name
  monitoring    = false

  availability_zone      = var.availability_zone_0
  subnet_id              = var.private_subnet_id_0
  vpc_security_group_ids = ["${var.allow_bastion_ssh}", "${var.allow_outbound}", "${var.allow_ping}"]

  user_data = <<EOF
#!/bin/bash
sudo echo "$(date '+%d%m%Y_%Hh%M') - Changing Hostname of Ansible Server" >> /var/log/terraform.log
sudo hostname "ansible-server01-${var.environment}"
sudo echo "ansible-server01-${var.environment}" > /etc/hostname

sudo echo "$(date '+%d%m%Y_%Hh%M') - Running updates with apt-get" >> /var/log/terraform.log
sudo yum update -y

sudo echo "$(date '+%d%m%Y_%Hh%M') - Copying the SSH Key to Ansible server" >> /var/log/terraform.log
sudo echo "${var.SSH_PRIVATE_KEY}" > /home/ec2-user/.ssh/"terraform-aws-${var.environment}"
sudo chown ec2-user:root /home/ec2-user/.ssh/"terraform-aws-${var.environment}"

sudo echo "$(date '+%d%m%Y_%Hh%M') - Setup Ansible Server" >> /var/log/terraform.log
sudo yum install epel-release -y
sudo yum install ansible -y
sudo echo "$(date '+%d%m%Y_%Hh%M') - Ansible Setup Successfully" >> /var/log/terraform.log
sudo ansible --version >> /var/log/terraform.log

sudo echo "$(date '+%d%m%Y_%Hh%M') - Changing permissions of the SSH Key" >> /var/log/terraform.log
sudo chmod 400 /home/ec2-user/.ssh/"terraform-aws-${var.environment}"

sudo echo "$(date '+%d%m%Y_%Hh%M') - Rebooting" >> /var/log/terraform.log
sudo reboot
EOF

  tags = {
    Type = var.ansible_instance_type
    App  = "ansible"
  }
}
