resource "grafana_cloud_stack" "ktechdevops" {
  provider = grafana.cloud

  name        = "ktechdevops.grafana.net"
  slug        = "ktechdevops"
  region_slug = "prod-us-east-0"
  url         = "https://ktechdevops.grafana.net"

  lifecycle {
    prevent_destroy = true
  }
}
