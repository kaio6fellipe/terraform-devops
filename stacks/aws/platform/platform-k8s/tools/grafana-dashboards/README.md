<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_grafana_rds"></a> [grafana\_rds](#module\_grafana\_rds) | terraform-aws-modules/rds/aws | 5.0.3 |
| <a name="module_sg_grafana_db"></a> [sg\_grafana\_db](#module\_sg\_grafana\_db) | terraform-aws-modules/security-group/aws | 4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.rds_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_db_snapshot.db_snapshot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/db_snapshot) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AWS_RDS_PASSWORD"></a> [AWS\_RDS\_PASSWORD](#input\_AWS\_RDS\_PASSWORD) | AWS RDS generic root password | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->