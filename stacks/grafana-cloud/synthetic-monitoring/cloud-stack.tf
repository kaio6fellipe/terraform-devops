resource "grafana_cloud_api_key" "metrics_publish" {
  name           = "MetricsPublisherForSM"
  role           = "MetricsPublisher"
  cloud_org_slug = local.ktech_devops_stack_slug

  lifecycle {
    prevent_destroy = true
  }
}

resource "grafana_synthetic_monitoring_installation" "sm_stack" {
  stack_id              = local.ktech_devops_stack_id
  metrics_publisher_key = grafana_cloud_api_key.metrics_publish.key
}

provider "grafana" {
  alias           = "sm"
  sm_access_token = grafana_synthetic_monitoring_installation.sm_stack.sm_access_token
  sm_url          = grafana_synthetic_monitoring_installation.sm_stack.stack_sm_api_url
}
