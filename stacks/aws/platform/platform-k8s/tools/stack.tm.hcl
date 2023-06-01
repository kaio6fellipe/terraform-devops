stack {
  name        = "tools"
  description = "Stack responsible for the tools deployed on the bootstrap of the platform K8S cluster"
  id          = "BETjPJxNR6AlqDWc8K3HFXSudy1GbhJ0XJpa"

  tags = [
    "helm"
  ]

  before = [
    "/stacks/aws/apps",
    "/stacks/aws/platform/platform-k8s/tools/grafana-dashboards",
    "/stacks/aws/platform/platform-k8s/tools/loki",
    "/stacks/aws/platform/platform-k8s/tools/mimir",
    "/stacks/aws/platform/platform-k8s/tools/tempo"
  ]
}
