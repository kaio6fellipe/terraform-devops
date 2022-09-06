module "ec2-instance01" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.1"

  name = "grafana-loki01-${var.environment}"

  ami           = var.amazon_linux_2
  instance_type = var.instance_type
  key_name      = var.key_name
  monitoring    = false

  availability_zone      = var.availability_zone_1
  subnet_id              = var.private_subnet_id_1
  vpc_security_group_ids = ["${aws_security_group.loki_http_instance.id}", "${var.allow_bastion_ssh}", "${var.allow_ansible_admin_subnet_ssh}", "${var.allow_outbound}", "${var.allow_ping}"]

  user_data = <<EOF
#!/bin/bash
sudo echo "$(date '+%d%m%Y_%Hh%M') - Changing Hostname of Grafana loki" >> /var/log/terraform.log
sudo hostname "grafana-loki01-${var.environment}"
sudo echo "grafana-loki01-${var.environment}" > /etc/hostname

sudo echo "$(date '+%d%m%Y_%Hh%M') - Running updates with apt update and upgrade" >> /var/log/terraform.log
sudo yum update -y
sudo yum upgrade -y
EOF

  tags = {
    Type = var.instance_type
    App  = "grafana-loki"
  }
}

module "ec2-instance02" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.1"

  name = "grafana-loki02-${var.environment}"

  ami           = var.amazon_linux_2
  instance_type = var.instance_type
  key_name      = var.key_name
  monitoring    = false

  availability_zone      = var.availability_zone_2
  subnet_id              = var.private_subnet_id_2
  vpc_security_group_ids = ["${var.allow_bastion_ssh}", "${var.allow_ansible_admin_subnet_ssh}", "${var.allow_outbound}", "${var.allow_ping}"]

  user_data = <<EOF
#!/bin/bash
sudo echo "$(date '+%d%m%Y_%Hh%M') - Changing Hostname of Grafana loki" >> /var/log/terraform.log
sudo hostname "grafana-loki02-${var.environment}"
sudo echo "grafana-loki02-${var.environment}" > /etc/hostname

sudo echo "$(date '+%d%m%Y_%Hh%M') - Running updates with apt update and upgrade" >> /var/log/terraform.log
sudo yum update -y
sudo yum upgrade -y
EOF

  tags = {
    Type = var.instance_type
    App  = "grafana-loki"
  }
}
