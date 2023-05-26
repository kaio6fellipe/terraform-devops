stack {
  name        = "apps"
  description = "Stack responsible for the first layer and base apps configurations"
  id          = "AsWNLnODc4DMylCwref8vh84Q4e3oB3ypJbC"

  after = [
    "/stacks/platform",
    "/stacks/platform/ansible-server",
    "/stacks/platform/bastion",
    "/stacks/platform/platform-k8s",
    "/stacks/platform/platform-k8s/tools",
    "/stacks/platform/platform-k8s/tools/grafana-dashboards",
    "/stacks/platform/platform-k8s/tools/loki",
    "/stacks/platform/platform-k8s/tools/mimir"
  ]
}

