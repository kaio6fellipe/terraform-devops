stack {
  name        = "bastion"
  description = "Stack responsible for the bastion server"

  before = [
    "/stacks/apps",
  ]
}
