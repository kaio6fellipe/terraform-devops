stack {
  name        = "platform"
  description = "Stack responsible for the first layer and base platform configurations"
  
  before = [
    "/stacks/apps",
  ]
}
