stack {
  name        = "platform"
  description = "Stack responsible for the first layer and base platform configurations"
  id          = "RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y"

  before = [
    "/stacks/aws/apps",
    "/stacks/aws/platform/ansible-server",
    "/stacks/aws/platform/bastion",
    "/stacks/aws/platform/platform-k8s"
  ]
}
