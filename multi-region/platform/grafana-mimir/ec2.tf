module "ec2-instance01" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.1"

  name = "grafana-mimir01-${var.environment}"

  ami           = var.amazon_linux_2
  instance_type = var.instance_type
  key_name      = var.key_name
  monitoring    = false
  iam_instance_profile = aws_iam_instance_profile.mimir_ec2_profile.id

  availability_zone      = var.availability_zone_1
  subnet_id              = var.private_subnet_id_1
  vpc_security_group_ids = ["${aws_security_group.mimir_cluster_instance.id}", "${aws_security_group.mimir_http_instance.id}", "${var.default_sg}"]

  user_data = <<EOF
#!/bin/bash
sudo echo "$(date '+%d%m%Y_%Hh%M') - Changing Hostname of Grafana mimir" >> /var/log/terraform.log
sudo hostname "grafana-mimir01-${var.environment}"
sudo echo "grafana-mimir01-${var.environment}" > /etc/hostname

sudo echo "$(date '+%d%m%Y_%Hh%M') - Running updates with apt update and upgrade" >> /var/log/terraform.log
sudo yum update -y
sudo yum upgrade -y
EOF

  tags = {
    Type = var.instance_type
    App  = "grafana-mimir"
  }
}
