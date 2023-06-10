resource "grafana_dashboard" "argocd-overview" {
  provider    = grafana.ktechdevops
  folder      = grafana_folder.argocd.uid
  message     = "Changed by Terraform"
  config_json = file("dashboards/argocd/argocd-overview.json")
  overwrite   = true
}

resource "grafana_dashboard" "integration---github" {
  for_each = fileset(path.module, "dashboards/integration---github/*.json")

  provider    = grafana.ktechdevops
  folder      = grafana_folder.integration-github.uid
  message     = "Managed by Terraform"
  config_json = file(each.value)
  overwrite   = true
}

resource "grafana_dashboard" "integration---cloudwatch-metrics" {
  for_each = fileset(path.module, "dashboards/integration---cloudwatch-metrics/*.json")

  provider    = grafana.ktechdevops
  folder      = grafana_folder.integration-cloudwatch-metrics.uid
  message     = "Managed by Terraform"
  config_json = file(each.value)
  overwrite   = true
}

resource "grafana_dashboard" "loki-dashboard" {
  provider    = grafana.ktechdevops
  folder      = grafana_folder.loki.uid
  message     = "Changed by Terraform"
  config_json = file("dashboards/loki/loki-dashboard.json")
  overwrite   = true
}

resource "grafana_dashboard" "node-exporter-full" {
  provider    = grafana.ktechdevops
  folder      = grafana_folder.integration-linux-node.uid
  message     = "Changed by Terraform"
  config_json = file("dashboards/integration---linux-node/node-exporter-full.json")
  overwrite   = true
}

resource "grafana_dashboard" "red" {
  provider    = grafana.ktechdevops
  message     = "Changed by Terraform"
  config_json = file("dashboards/general/red.json")
  overwrite   = true
}
