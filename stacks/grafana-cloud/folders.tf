resource "grafana_folder" "github" {
  provider = grafana.ktechdevops
  uid      = "github"
  title    = "GitHub Dashboards"

  lifecycle {
    prevent_destroy = true
  }
}

resource "grafana_folder" "argocd" {
  provider = grafana.ktechdevops
  uid      = "argocd"
  title    = "ArgoCD"

  lifecycle {
    prevent_destroy = true
  }
}

resource "grafana_folder" "loki" {
  provider = grafana.ktechdevops
  uid      = "loki"
  title    = "Loki"

  lifecycle {
    prevent_destroy = true
  }
}

resource "grafana_folder" "aws" {
  provider = grafana.ktechdevops
  uid      = "aws"
  title    = "AWS"

  lifecycle {
    prevent_destroy = true
  }
}