module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.1"

  name = "ansible-server01-${var.environment}"

  ami                  = var.amazon_linux_2
  instance_type        = var.ansible_instance_type
  key_name             = var.key_name
  monitoring           = false
  iam_instance_profile = aws_iam_instance_profile.ansible_ec2_profile.id

  availability_zone      = var.availability_zone_0
  subnet_id              = var.private_subnet_id_0
  vpc_security_group_ids = ["${aws_security_group.egress_ping.id}", "${var.default_sg}"]

  user_data = <<EOF
#!/bin/bash
sudo echo "$(date '+%d%m%Y_%Hh%M') - Changing Hostname of Ansible Server" >> /var/log/terraform.log
sudo hostname "ansible-server01-${var.environment}"
sudo echo "ansible-server01-${var.environment}" > /etc/hostname

sudo echo "$(date '+%d%m%Y_%Hh%M') - Running updates with apt-get" >> /var/log/terraform.log
sudo yum update -y

sudo echo "$(date '+%d%m%Y_%Hh%M') - Copying the SSH Key and Vault Password File to Ansible server" >> /var/log/terraform.log
sudo echo "${var.SSH_PRIVATE_KEY}" > /home/ec2-user/.ssh/"terraform-aws-${var.environment}"
sudo echo "${var.ANSIBLE_VAULT_PASSWORD}" > /home/ec2-user/".vault_password_file-${var.environment}"
sudo chown ec2-user:root /home/ec2-user/.ssh/"terraform-aws-${var.environment}"
sudo chown ec2-user:root /home/ec2-user/".vault_password_file-${var.environment}"

sudo echo "$(date '+%d%m%Y_%Hh%M') - Setup Ansible Server" >> /var/log/terraform.log
# sudo amazon-linux-extras install epel -y
sudo amazon-linux-extras enable python3.8
sudo yum install python3.8 -y
sudo pip3 install ansible
sudo echo "$(date '+%d%m%Y_%Hh%M') - Ansible Setup Successfully" >> /var/log/terraform.log
sudo ansible --version >> /var/log/terraform.log

sudo echo "$(date '+%d%m%Y_%Hh%M') - Changing permissions of the SSH Key and Vault Password File" >> /var/log/terraform.log
sudo chmod 400 /home/ec2-user/.ssh/"terraform-aws-${var.environment}"
sudo chmoe 400 /home/ec2-user/".vault_password_file-${var.environment}"

sudo echo "$(date '+%d%m%Y_%Hh%M') - Installing Code Deploy agent" >> /var/log/terraform.log
sudo yum update -y
sudo yum install ruby -y
sudo yum install wget -y
wget https://aws-codedeploy-${var.region}.s3.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo echo "$(date '+%d%m%Y_%Hh%M') - Code Deploy Installation completed" >> /var/log/terraform.log

sudo echo "$(date '+%d%m%Y_%Hh%M') - Installing python-boto3" >> /var/log/terraform.log
sudo yum install python-boto3 -y
sudo pip3 install boto3
sudo pip3 install botocore

sudo echo "$(date '+%d%m%Y_%Hh%M') - Configuring AWS CLI" >> /var/log/terraform.log
sudo mkdir /home/ec2-user/.aws
sudo echo "[default]" > /home/ec2-user/.aws/credentials
sudo echo "[default]" > /home/ec2-user/.aws/config
sudo echo "credential_source = Ec2InstanceMetadata" >> /home/ec2-user/.aws/config
sudo echo "region = ${var.region}" >> /home/ec2-user/.aws/config
sudo chown -R ec2-user:ec2-user /home/ec2-user/.aws

sudo echo "$(date '+%d%m%Y_%Hh%M') - Setup Env variables" >> /var/log/terraform.log
sudo echo "export ENV=${var.environment}"
sudo echo "export ENV=${var.environment}" >> /home/ec2-user/.bashrc
sudo echo "export ENV=${var.environment}" >> /root/.bashrc
sudo source ~/.bashrc

sudo echo "$(date '+%d%m%Y_%Hh%M') - Rebooting" >> /var/log/terraform.log
sudo reboot
EOF

  tags = {
    Type = var.ansible_instance_type
    App  = "ansible-${var.environment}"
  }
}
