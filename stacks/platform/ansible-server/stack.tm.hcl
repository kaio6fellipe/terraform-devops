stack {
  name        = "ansible-server"
  description = "Stack responsible for the ansible server (controller)"

  before = [
    "/stacks/apps",
    "/stacks/platform/bastion"
  ]
}
