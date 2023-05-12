locals {
  vpc_id = try(local.stacks_outputs.vpc_id, "[null]")
}