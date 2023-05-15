module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.1"

  name = "bastion01-${local.environment}"

  ami           = local.amazon_linux_2
  instance_type = local.instance_type
  key_name      = local.key_name
  monitoring    = false

  availability_zone      = local.availability_zone_0
  subnet_id              = local.public_subnet_id_0
  vpc_security_group_ids = [aws_security_group.bastion_public_ssh.id, local.bastion_default_sg, aws_security_group.bastion_uptimerobot_ssh.id]

  user_data = <<EOF
#!/bin/bash
sudo echo "$(date '+%d%m%Y_%Hh%M') - Changing Hostname of Bastion Server" >> /var/log/terraform.log
sudo hostname "bastion01-${local.environment}"
sudo echo "bastion01-${local.environment}" > /etc/hostname

sudo echo "$(date '+%d%m%Y_%Hh%M') - Running updates with apt update and upgrade" >> /var/log/terraform.log
sudo yum update -y
sudo yum upgrade -y
EOF

  tags = {
    Type = local.instance_type
    App  = "bastion"
  }
}
