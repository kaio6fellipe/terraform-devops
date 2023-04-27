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
  vpc_security_group_ids = ["${aws_security_group.bastion_public_ssh.id}", "${var.default_sg}", "${aws_security_group.bastion_uptimerobot_ssh.id}"]

  user_data = <<EOF
#!/bin/bash
sudo echo "$(date '+%d%m%Y_%Hh%M') - Changing Hostname of Bastion Server" >> /var/log/terraform.log
sudo hostname "bastion01-${var.environment}"
sudo echo "bastion01-${var.environment}" > /etc/hostname

sudo echo "$(date '+%d%m%Y_%Hh%M') - Running updates with apt update and upgrade" >> /var/log/terraform.log
sudo yum update -y
sudo yum upgrade -y
EOF

  tags = {
    Type = var.instance_type
    App  = "bastion"
  }
}
