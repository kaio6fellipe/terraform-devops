data "aws_db_snapshot" "db_snapshot" {
    most_recent = true
    db_instance_identifier = "grafana-rds-${var.environment}"
}