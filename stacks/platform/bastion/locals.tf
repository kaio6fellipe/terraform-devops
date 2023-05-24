locals {
  vpc_id                        = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks_outputs.vpc_id, "[null]")
  amazon_linux_2                = try(local.RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y-platform_outputs.amazon_linux_2, "[null]")
  availability_zone_0           = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks_outputs.availability_zone_0, "[null]")
  public_subnet_id_0            = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks_outputs.public_subnet_id_0, "[null]")
  bastion_default_sg            = try(local.RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y-platform_outputs.bastion_default_sg, "[null]")
  public_dns_zone_id            = try(local.RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y-platform_outputs.public_dns_zone_id, "[null]")
  public_dns_zone_name          = try(local.RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y-platform_outputs.public_dns_zone_name, "[null]")
  private_dns_zone_id           = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks_outputs.private_dns_zone_id, "[null]")
  private_dns_zone_name         = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks_outputs.private_dns_zone_name, "[null]")
  cidrs_remote_access           = try(local.RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y-platform_outputs.cidrs_remote_access, ["0.0.0.0/0"])
  cidrs_uptime_robot_monitoring = try(local.RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y-platform_outputs.cidrs_uptime_robot_monitoring, ["0.0.0.0/0"])
}
