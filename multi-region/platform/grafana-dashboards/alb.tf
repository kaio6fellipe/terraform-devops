module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "6.0"

  name = "alb-grafana-dashboards-${var.environment}"

  load_balancer_type = "application"

  vpc_id          = var.vpc_id
  subnets         = [var.public_subnet_id_1, var.public_subnet_id_2]
  security_groups = [aws_security_group.sg_grafana_http.id, aws_security_group.sg_grafana_https.id, var.allow_outbound, var.allow_ping]

  target_groups = [
    {
      name_prefix      = "graf-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/login"
        port                = "traffic-port"
        healthy_threshold   = 2
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200"
      }
      targets = {
        target = {
          target_id = "${module.ec2-instance.id}"
          port      = 3000
        }
      }
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = local.wildcard_certificate
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

  tags = {
    App = "grafana-dashboards"
  }
}
