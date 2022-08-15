resource "aws_codedeploy_app" "ansible" {
  compute_platform = "Server"
  name             = "ansible-app-${var.environment}"
}

resource "aws_codedeploy_deployment_config" "ansible" {
  deployment_config_name = "ansible-deployment-config-${var.environment}"

  minimum_healthy_hosts {
    type  = "HOST_COUNT"
    value = 0
  }
}

resource "aws_codedeploy_deployment_group" "ansible" {
  app_name               = aws_codedeploy_app.ansible.name
  deployment_group_name  = "ansible-group-${var.environment}"
  service_role_arn       = aws_iam_role.codedeploy_role.arn
  deployment_config_name = aws_codedeploy_deployment_config.ansible.id

  ec2_tag_set {
    ec2_tag_filter {
      key   = "App"
      type  = "KEY_AND_VALUE"
      value = "ansible-${var.environment}"
    }
  }
}
