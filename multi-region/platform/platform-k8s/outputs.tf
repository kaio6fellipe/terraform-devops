output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.platform_eks.cluster_endpoint
}
