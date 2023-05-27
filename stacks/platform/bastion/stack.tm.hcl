stack {
  name        = "bastion"
  description = "Stack responsible for the bastion server"
  id          = "ZPxdlGum35QVZgsSSmKTVPp85ayZ9qXtnhnX"

  before = [
    "/stacks/apps",
    "/stacks/platform/platform-k8s"
  ]

  after = [
    "/stacks/platform/ansible-server"
  ]
}
