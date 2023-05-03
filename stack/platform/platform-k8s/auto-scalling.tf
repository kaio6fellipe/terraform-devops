# resource "aws_autoscaling_policy" "too_many_pods" {
#   name                   = "too-many-pods/${local.name}"
#   scaling_adjustment     = 1
#   adjustment_type        = "ChangeInCapacity"
#   policy_type            = "SimpleScaling"
#   cooldown               = 330
#   autoscaling_group_name = module.eks.eks_managed_node_groups_autoscaling_group_names[0]
# }
