# module "node_termination_handler_irsa" {
#   source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
#   version = "5.17.0"
# 
#   role_name                              = "node-termination-handler-${local.environment}"
#   attach_node_termination_handler_policy = true
# 
#   oidc_providers = {
#     main = {
#       provider_arn               = module.eks.oidc_provider_arn
#       namespace_service_accounts = ["kube-system:aws-node-termination-handler"]
#     }
#   }
# 
#   tags = local.tags
# }
