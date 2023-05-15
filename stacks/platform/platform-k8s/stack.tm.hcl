stack {
  name        = "platform-k8s"
  description = "Stack responsible for the platform K8S cluster"

  before = [
    "/stacks/apps",
    "/stacks/platform/bastion",
    "/stacks/platform/ansible-server"
  ]
}
