stack {
  name        = "platform-k8s-apps"
  description = "Stack responsible for the apps deployed on the bootstrap of the platform K8S cluster"

  after = [
    "/stacks/platform/bastion",
    "/stacks/platform/ansible-server",
    "/stacks/platform/platform-k8s/node-group"
  ]
}
