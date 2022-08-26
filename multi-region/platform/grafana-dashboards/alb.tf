module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "6.0"

  name = "alb-grafana-dashboards-${var.environment}"

  load_balancer_type = "application"

  vpc_id             = var.vpc_id
  subnets            = [var.private_subnet_id_1, var.private_subnet_id_2]
  security_groups    = [aws_security_group.sg_grafana_http.id, aws_security_group.sg_grafana_https.id]

  target_groups = [
    {
      name_prefix      = "alb-grafana-dashboards-${var.environment}"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        target = {
          target_id = "${module.ec2-instance.id}"
          port = 3000
        }
      }
    }
  ]

  # https_listeners = [
  #   {
  #     port               = 443
  #     protocol           = "HTTPS"
  #     certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
  #     target_group_index = 0
  #   }
  # ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    App = "grafana-dashboards"
  }
}