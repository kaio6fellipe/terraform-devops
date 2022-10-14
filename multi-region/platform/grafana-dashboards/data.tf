data "aws_db_snapshot" "db_snapshot" {
  most_recent            = true
  db_instance_identifier = "grafana-rds-${var.environment}"
}

data "aws_acm_certificate" "wildcard_certificate" {
  domain      = "*.ktech-devops.com.br"
  most_recent = true
}
