output "ktech_devops_stack_slug" {
  value     = grafana_cloud_stack.ktechdevops.slug
  sensitive = true
}

output "ktech_devops_stack_id" {
  value     = grafana_cloud_stack.ktechdevops.id
  sensitive = true
}

output "ktechdevops_stack_url" {
  value     = grafana_cloud_stack.ktechdevops.url
  sensitive = true
}

output "ktechdevops_stack_management_key" {
  value     = grafana_cloud_stack_api_key.management.key
  sensitive = true
}