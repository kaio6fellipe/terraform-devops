resource "grafana_folder" "integration-github" {
  provider = grafana.ktechdevops
  uid      = "integration---github"
  title    = "Integration - Github (Terraform)"

  lifecycle {
    prevent_destroy = true
  }
}

resource "grafana_folder" "argocd" {
  provider = grafana.ktechdevops
  uid      = "argocd"
  title    = "ArgoCD (Terraform)"

  lifecycle {
    prevent_destroy = true
  }
}

resource "grafana_folder" "loki" {
  provider = grafana.ktechdevops
  uid      = "loki"
  title    = "Loki (Terraform)"

  lifecycle {
    prevent_destroy = true
  }
}

resource "grafana_folder" "integration-cloudwatch-metrics" {
  provider = grafana.ktechdevops
  uid      = "integration---cloudwatch-metrics"
  title    = "Integration - CloudWatch Metrics (Terraform)"

  lifecycle {
    prevent_destroy = true
  }
}

resource "grafana_folder" "integration-linux-node" {
  provider = grafana.ktechdevops
  uid      = "integration---linux-node"
  title    = "Integration - Linux Node (Terraform)"

  lifecycle {
    prevent_destroy = true
  }
}

resource "grafana_folder" "integration-kubernetes" {
  provider = grafana.ktechdevops
  uid      = "integration---kubernetes"
  title    = "Integration - Kubernetes (Terraform)"

  lifecycle {
    prevent_destroy = true
  }
}

resource "grafana_folder" "integration-docker" {
  provider = grafana.ktechdevops
  uid      = "integration---docker"
  title    = "Integration - Docker (Terraform)"

  lifecycle {
    prevent_destroy = true
  }
}

resource "grafana_folder" "integration-grafana-agent" {
  provider = grafana.ktechdevops
  uid      = "integration---grafana-agent"
  title    = "Integration - Grafana Agent (Terraform)"

  lifecycle {
    prevent_destroy = true
  }
}

resource "grafana_folder" "synthetic-monitoring" {
  provider = grafana.ktechdevops
  uid      = "b43f123b-c1c2-46f9-92da-760324165f95"
  title    = "Synthetic Monitoring (Terraform)"

  lifecycle {
    prevent_destroy = true
  }
}