output "current_identity_arn" {
  value     = data.aws_caller_identity.current.arn
  sensitive = true
}

output "current_identity_account_id" {
  value     = data.aws_caller_identity.current.account_id
  sensitive = true
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_id" {
  value = module.eks.cluster_id
}

output "cluster_version" {
  value = module.eks.cluster_version
}

output "cluster_primary_security_group_id" {
  value = module.eks.cluster_primary_security_group_id
}

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}

output "node_security_group_id" {
  value = module.eks.node_security_group_id
}

output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}
