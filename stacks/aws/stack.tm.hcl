stack {
  name        = "aws"
  description = "Stack responsible for the first layer and base network configurations like VPC and Route53"
  id          = "vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN"

  before = [
    "/stacks/aws/apps",
    "/stacks/aws/platform",
  ]
}
