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

resource "grafana_cloud_stack_api_key" "management" {
  provider = grafana.cloud

  stack_slug = grafana_cloud_stack.ktechdevops.slug
  name       = "ktechdevops-management-key"
  role       = "Admin"

  lifecycle {
    prevent_destroy = true
  }
}

provider "grafana" {
  alias = "ktechdevops"

  url  = grafana_cloud_stack.ktechdevops.url
  auth = grafana_cloud_stack_api_key.management.key
}