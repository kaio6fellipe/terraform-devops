resource "grafana_dashboard" "argocd" {
  for_each = fileset(path.module, "dashboards/argocd/*.json")

  provider    = grafana.ktechdevops
  folder      = grafana_folder.argocd.uid
  message     = "Managed by Terraform"
  config_json = file(each.value)
  overwrite   = true
}

resource "grafana_dashboard" "general" {
  for_each = fileset(path.module, "dashboards/general/*.json")

  provider    = grafana.ktechdevops
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

resource "grafana_dashboard" "integration---github" {
  for_each = fileset(path.module, "dashboards/integration---github/*.json")

  provider    = grafana.ktechdevops
  folder      = grafana_folder.integration-github.uid
  message     = "Managed by Terraform"
  config_json = file(each.value)
  overwrite   = true
}

resource "grafana_dashboard" "integration---linux-node" {
  for_each = fileset(path.module, "dashboards/integration---linux-node/*.json")

  provider    = grafana.ktechdevops
  folder      = grafana_folder.integration-linux-node.uid
  message     = "Managed by Terraform"
  config_json = file(each.value)
  overwrite   = true
}

resource "grafana_dashboard" "loki" {
  for_each = fileset(path.module, "dashboards/loki/*.json")

  provider    = grafana.ktechdevops
  folder      = grafana_folder.loki.uid
  message     = "Managed by Terraform"
  config_json = file(each.value)
  overwrite   = true
}
