stack {
  name        = "ansible-server"
  description = "Stack responsible for the ansible server (controller)"
  id          = "j0JZtFqC1PZUpGs1P4M6cymb44E5hR6Bwffn"

  before = [
    "/stacks/aws/apps",
    "/stacks/aws/platform/bastion",
    "/stacks/aws/platform/platform-k8s"
  ]
}
