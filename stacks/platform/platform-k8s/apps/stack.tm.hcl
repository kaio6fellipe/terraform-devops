stack {
  name        = "apps"
  description = "Stack responsible for the apps deployed on the bootstrap of the platform K8S cluster"
  id          = "BETjPJxNR6AlqDWc8K3HFXSudy1GbhJ0XJpa"

  after = [
    "/stacks/platform/bastion",
    "/stacks/platform/ansible-server",
    # "/stacks/platform/platform-k8s/node-group"
  ]
}
