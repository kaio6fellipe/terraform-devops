stack {
  name        = "platform-k8s"
  description = "Stack responsible for the platform K8S cluster"
  id          = "PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC"

  after = [
    "/stacks/platform/bastion",
    "/stacks/platform/ansible-server"
  ]

  before = [
    "/stacks/apps",
    "/stacks/platform/platform-k8s/tools"
  ]
}
