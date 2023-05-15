stack {
  name        = "platform-k8s"
  description = "Stack responsible for the platform K8S cluster"

  after = [
    "/stacks/platform/bastion",
    "/stacks/platform/ansible-server"
  ]
}
