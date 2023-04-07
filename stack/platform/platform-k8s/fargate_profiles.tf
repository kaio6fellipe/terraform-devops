# module "fargate_profile" {
#   source = "../../modules/fargate-profile"
# 
#   name         = "separate-fargate-profile"
#   cluster_name = module.eks.cluster_name
# 
#   subnet_ids = module.vpc.private_subnets
#   selectors = [{
#     namespace = "kube-system"
#   }]
# 
#   tags = merge(local.tags, { Separate = "fargate-profile" })
# }