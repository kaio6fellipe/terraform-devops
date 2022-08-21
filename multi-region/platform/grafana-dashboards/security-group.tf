resource "aws_security_group" "grafana_http" {
  name        = "grafana_http-${var.environment}"
  description = "grafana_http-${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto
  }
  tags = {
    Name = "ssh"
  }
}
