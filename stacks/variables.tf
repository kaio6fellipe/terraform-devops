variable "ARGO_GITHUB_SSO_SECRET_KEY" {
  description = "GitHub SSO for ArgoCD Application "
  type        = string
  sensitive   = true
}

variable "CROSSPLANE_AWS_CREDENTIALS_CONTENT" {
  description = "Crossplane AWS Credentials content file"
  type        = string
  sensitive   = true
}
