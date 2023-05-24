locals {
  rds_identifier                    = "grafana-rds-${local.globals.environment}"
  database_subnet_group_name        = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks_outputs.database_subnet_group_name, "[null]")
  vpc_id                            = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks_outputs.vpc_id, "[null]")
  node_security_group_id            = try(local.PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s_outputs.node_security_group_id, "[null]")
  cluster_security_group_id         = try(local.PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s_outputs.cluster_security_group_id, "[null]")
  cluster_primary_security_group_id = try(local.PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s_outputs.cluster_primary_security_group_id, "[null]")
  private_dns_zone_id               = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks_outputs.private_dns_zone_id, "[null]")
  private_dns_zone_name             = try(local.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-stacks_outputs.private_dns_zone_name, "[null]")
}
