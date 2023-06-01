stack {
  name        = "platform-k8s"
  description = "Stack responsible for the platform K8S cluster"
  id          = "PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC"

  after = [
    "/stacks/aws/platform/bastion",
    "/stacks/aws/platform/ansible-server"
  ]

  before = [
    "/stacks/aws/apps",
    "/stacks/aws/platform/platform-k8s/tools"
  ]
}
