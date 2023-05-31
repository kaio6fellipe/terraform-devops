stack {
  name        = "bastion"
  description = "Stack responsible for the bastion server"
  id          = "ZPxdlGum35QVZgsSSmKTVPp85ayZ9qXtnhnX"

  before = [
    "/stacks/aws/apps",
    "/stacks/aws/platform/platform-k8s"
  ]

  after = [
    "/stacks/aws/platform/ansible-server"
  ]
}
