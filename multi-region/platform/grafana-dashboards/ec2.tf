module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.1"

  name = "grafana-dashboards01-${var.environment}"

  ami           = var.amazon_linux_2
  instance_type = var.instance_type
  key_name      = var.key_name
  monitoring    = false

  availability_zone      = var.availability_zone_1
  subnet_id              = var.private_subnet_id_1
  vpc_security_group_ids = ["${aws_security_group.grafana_http_instance.id}", "${var.default_sg}"]

  user_data = <<EOF
#!/bin/bash
sudo echo "$(date '+%d%m%Y_%Hh%M') - Changing Hostname of Grafana Dashboards" >> /var/log/terraform.log
sudo hostname "grafana-dashboards01-${var.environment}"
sudo echo "grafana-dashboards01-${var.environment}" > /etc/hostname

sudo echo "$(date '+%d%m%Y_%Hh%M') - Running updates with apt update and upgrade" >> /var/log/terraform.log
sudo yum update -y
sudo yum upgrade -y
EOF

  tags = {
    Type = var.instance_type
    App  = "grafana-dashboards"
  }
}
