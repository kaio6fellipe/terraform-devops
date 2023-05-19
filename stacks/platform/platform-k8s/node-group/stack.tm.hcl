stack {
  name        = "platform-k8s-node-group"
  description = "Stack responsible for the node-group management of the platform K8S cluster"

  after = [
    "/stacks/platform/bastion",
    "/stacks/platform/ansible-server",
  ]
}
