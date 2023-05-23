module "sg_grafana_db" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.0"

  name        = "grafana_db-${local.environment}"
  description = "Allow connections from Platform K8S Cluster to Grafana Database"
  vpc_id      = local.vpc_id

  # ingress
  ingress_with_source_security_group_id = [
    {
      from_port                = 5432
      to_port                  = 5432
      protocol                 = "tcp"
      description              = "PostgreSQL access from within VPC for Platform EKS Nodes"
      source_security_group_id = local.node_security_group_id
    },
    {
      from_port                = 5432
      to_port                  = 5432
      protocol                 = "tcp"
      description              = "PostgreSQL access from within VPC for Platform EKS Cluster"
      source_security_group_id = local.cluster_security_group_id
    },
  ]
}
