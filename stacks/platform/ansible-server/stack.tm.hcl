stack {
  name        = "ansible-server"
  description = "Stack responsible for the ansible server (controller)"
  id          = "j0JZtFqC1PZUpGs1P4M6cymb44E5hR6Bwffn"

  before = [
    "/stacks/apps",
    "/stacks/platform/bastion",
    "/stacks/platform/platform-k8s"
  ]
}
