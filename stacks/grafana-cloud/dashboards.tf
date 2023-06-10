resource "grafana_dashboard" "argocd-overview" {
  provider    = grafana.ktechdevops
  folder      = grafana_folder.argocd.uid
  message     = "Changed by Terraform"
  config_json = file("dashboards/argocd-overview.json")
  overwrite   = true
}

resource "grafana_dashboard" "github-details" {
  provider    = grafana.ktechdevops
  folder      = grafana_folder.integration-github.uid
  message     = "Changed by Terraform"
  config_json = file("dashboards/github-details.json")
  overwrite   = true
}

resource "grafana_dashboard" "github-overview" {
  provider    = grafana.ktechdevops
  folder      = grafana_folder.integration-github.uid
  message     = "Changed by Terraform"
  config_json = file("dashboards/github-overview.json")
  overwrite   = true
}

resource "grafana_dashboard" "loki-dashboard" {
  provider    = grafana.ktechdevops
  folder      = grafana_folder.loki.uid
  message     = "Changed by Terraform"
  config_json = file("dashboards/loki-dashboard.json")
  overwrite   = true
}

resource "grafana_dashboard" "node-exporter-full" {
  provider    = grafana.ktechdevops
  folder      = grafana_folder.integration-linux-node.uid
  message     = "Changed by Terraform"
  config_json = file("dashboards/node-exporter-full.json")
  overwrite   = true
}

resource "grafana_dashboard" "red" {
  provider    = grafana.ktechdevops
  message     = "Changed by Terraform"
  config_json = file("dashboards/red.json")
  overwrite   = true
}
