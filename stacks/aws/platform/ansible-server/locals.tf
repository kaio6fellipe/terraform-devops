locals {
  vpc_id                = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-aws_outputs.vpc_id, "[null]")
  amazon_linux_2        = try(local.RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y-platform_outputs.amazon_linux_2, "[null]")
  availability_zone_0   = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-aws_outputs.availability_zone_0, "[null]")
  private_subnet_id_0   = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-aws_outputs.private_subnet_id_0, "[null]")
  ansible_default_sg    = try(local.RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y-platform_outputs.ansible_default_sg, "[null]")
  private_dns_zone_id   = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-aws_outputs.private_dns_zone_id, "[null]")
  private_dns_zone_name = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-aws_outputs.private_dns_zone_name, "[null]")
}
