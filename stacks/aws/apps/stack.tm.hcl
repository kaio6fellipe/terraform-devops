stack {
  name        = "apps"
  description = "Stack responsible for the first layer and base apps configurations"
  id          = "AsWNLnODc4DMylCwref8vh84Q4e3oB3ypJbC"

  after = [
    "/stacks/aws/platform"
  ]
}

