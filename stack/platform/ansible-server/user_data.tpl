#!/bin/bash
sudo echo "$(date '+%d%m%Y_%Hh%M') - Changing Hostname of Ansible Server" >> /var/log/terraform.log
sudo hostname "ansible-server01-${environment}"
sudo echo "ansible-server01-${environment}" > /etc/hostname

sudo echo "$(date '+%d%m%Y_%Hh%M') - Running updates with apt-get" >> /var/log/terraform.log
sudo yum update -y

sudo echo "$(date '+%d%m%Y_%Hh%M') - Copying the SSH Key and Vault Password File to Ansible server" >> /var/log/terraform.log
sudo echo "${SSH_PRIVATE_KEY}" > /home/ec2-user/.ssh/"terraform-aws-${environment}"
sudo echo "${ANSIBLE_VAULT_PASSWORD}" > /home/ec2-user/".vault_password_file-${environment}"
sudo chown ec2-user:root /home/ec2-user/.ssh/"terraform-aws-${environment}"
sudo chown ec2-user:root /home/ec2-user/".vault_password_file-${environment}"

sudo echo "$(date '+%d%m%Y_%Hh%M') - Setup Ansible Server" >> /var/log/terraform.log
# sudo amazon-linux-extras install epel -y
sudo amazon-linux-extras enable python3.8
sudo yum install python3.8 -y
sudo pip3 install --no-cache-dir ansible==7.4.0
sudo echo "$(date '+%d%m%Y_%Hh%M') - Ansible Setup Successfully" >> /var/log/terraform.log
sudo ansible --version >> /var/log/terraform.log

sudo echo "$(date '+%d%m%Y_%Hh%M') - Changing permissions of the SSH Key and Vault Password File" >> /var/log/terraform.log
sudo chmod 400 /home/ec2-user/.ssh/"terraform-aws-${environment}"
sudo chmoe 400 /home/ec2-user/".vault_password_file-${environment}"

sudo echo "$(date '+%d%m%Y_%Hh%M') - Installing Code Deploy agent" >> /var/log/terraform.log
sudo yum update -y
sudo yum install ruby -y
sudo yum install wget -y
wget https://aws-codedeploy-${region}.s3.amazonaws.com/latest/install
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
sudo echo "region = ${region}" >> /home/ec2-user/.aws/config
sudo chown -R ec2-user:ec2-user /home/ec2-user/.aws

sudo echo "$(date '+%d%m%Y_%Hh%M') - Setup Env variables" >> /var/log/terraform.log
sudo echo "export ENV=${environment}"
sudo echo "export ENV=${environment}" >> /home/ec2-user/.bashrc
sudo echo "export ENV=${environment}" >> /root/.bashrc
sudo source ~/.bashrc

sudo echo "$(date '+%d%m%Y_%Hh%M') - Rebooting" >> /var/log/terraform.log
sudo reboot