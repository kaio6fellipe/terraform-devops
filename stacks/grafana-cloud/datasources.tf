resource "grafana_data_source" "testdata" {
  provider = grafana.ktechdevops
  type     = "testdata"
  name     = "TestData"

  lifecycle {
    prevent_destroy = true
  }
}

resource "grafana_data_source" "github" {
  provider = grafana.ktechdevops
  type     = "grafana-github-datasource"
  name     = "GitHub"

  secure_json_data_encoded = jsonencode({
    access_token = var.GITHUB_PAT
  })

  lifecycle {
    prevent_destroy = true
  }
}