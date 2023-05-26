stack {
  name        = "platform"
  description = "Stack responsible for the first layer and base platform configurations"
  id          = "RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y"

  before = [
    "/stacks/apps",
    "/stacks/platform/ansible-server",
    "/stacks/platform/bastion",
    "/stacks/platform/platform-k8s"
  ]
}
