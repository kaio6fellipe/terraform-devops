resource "aws_cloudwatch_log_metric_filter" "too_many_pods" {
  name           = "too-many-pods/${local.name}"
  pattern        = "Too many pods"
  log_group_name = module.eks.cloudwatch_log_group_name

  metric_transformation {
    name          = "too-many-pods/${local.name}"
    namespace     = "kubernetes"
    value         = "1"
    default_value = "0"
  }
}

resource "aws_cloudwatch_metric_alarm" "too_many_pods" {
  alarm_name          = "too-many-pods/${local.name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "too-many-pods/${local.name}"
  namespace           = "kubernetes"
  period              = 300
  statistic           = "Sum"
  threshold           = 1

  dimensions = {
    AutoScalingGroupName = module.eks.eks_managed_node_groups_autoscaling_group_names[0]
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.too_many_pods.arn]
}