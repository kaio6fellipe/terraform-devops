stack {
  name        = "tools"
  description = "Stack responsible for the tools deployed on the bootstrap of the platform K8S cluster"
  id          = "BETjPJxNR6AlqDWc8K3HFXSudy1GbhJ0XJpa"

  # after = [
  #   "/stacks/platform/bastion",
  #   "/stacks/platform/ansible-server",
  #   # "/stacks/platform/platform-k8s/node-group"
  # ]

  before = [
    "/stacks/apps",
    "/stacks/platform/platform-k8s/tools/grafana-dashboards",
    "/stacks/platform/platform-k8s/tools/loki",
    "/stacks/platform/platform-k8s/tools/mimir"
  ]
}
