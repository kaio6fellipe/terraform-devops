resource "aws_codedeploy_app" "ansible" {
  compute_platform = "Server"
  name             = "ansible-app"
}

resource "aws_codedeploy_deployment_group" "ansible" {
  app_name              = aws_codedeploy_app.ansible.name
  deployment_group_name = "ansible-group"
  service_role_arn      = aws_iam_role.codedeploy_role.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Env"
      type  = "KEY_AND_VALUE"
      value = var.environment
    }

    ec2_tag_filter {
      key   = "App"
      type  = "KEY_AND_VALUE"
      value = "ansible"
    }
  }
}
