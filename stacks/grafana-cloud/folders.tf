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
  title   = "Integration - Linux Node (Terraform)"

  lifecycle {
    prevent_destroy = true
  }
}
