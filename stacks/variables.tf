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

variable "AWS_RDS_PASSWORD" {
  description = "AWS RDS generic root password"
  type        = string
  sensitive   = true
}

variable "GF_AUTH_GITHUB_CLIENT_ID" {
  description = "Grafana's GitHub authentication ClientID"
  type        = string
  sensitive   = true
}

variable "GF_AUTH_GITHUB_CLIENT_SECRET" {
  description = "Grafana's GitHub authentication ClientSecret"
  type        = string
  sensitive   = true
}

variable "GF_SECURITY_ADMIN_USER" {
  description = "Grafana's security admin user"
  type        = string
  sensitive   = true
}

variable "GF_SECURITY_ADMIN_PASSWORD" {
  description = "Grafana's security admin password"
  type        = string
  sensitive   = true
}

variable "GRAFANA_CLOUD_METRICSUSER" {
  description = "Grafana Cloud metrics user used for integrations (Grafana Agent)"
  type        = string
  sensitive   = true
}

variable "GRAFANA_CLOUD_LOGSUSER" {
  description = "Grafana Cloud logs user used for integrations (Grafana Agent)"
  type        = string
  sensitive   = true
}

variable "GRAFANA_CLOUD_TOKEN" {
  description = "Grafana Cloud token used for integrations (Grafana Agent)"
  type        = string
  sensitive   = true
}
