module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "6.0"

  name     = "alb-grafana-loki-${var.environment}"
  internal = true

  load_balancer_type = "application"

  vpc_id          = var.vpc_id
  subnets         = [var.private_subnet_id_1, var.private_subnet_id_2]
  security_groups = [aws_security_group.sg_loki_http.id, aws_security_group.sg_loki_https.id, var.allow_outbound, var.allow_ping]

  target_groups = [
    {
      name_prefix      = "loki-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/metrics"
        port                = "traffic-port"
        healthy_threshold   = 2
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200"
      }
      targets = {
        target01 = {
          target_id = "${module.ec2-instance01.id}"
          port      = 3100
        }
        target02 = {
          target_id = "${module.ec2-instance02.id}"
          port      = 3100
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
    App = "grafana-loki"
  }
}
