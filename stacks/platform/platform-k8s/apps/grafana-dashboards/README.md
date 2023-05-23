<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.2.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.57.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.57.1 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_grafana_rds"></a> [grafana\_rds](#module\_grafana\_rds) | terraform-aws-modules/rds/aws | 5.0.3 |
| <a name="module_sg_grafana_db"></a> [sg\_grafana\_db](#module\_sg\_grafana\_db) | terraform-aws-modules/security-group/aws | 4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.rds_private](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/route53_record) | resource |
| [terraform_remote_state.stacks](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.stacks_platform_platform-k8s](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AWS_RDS_PASSWORD"></a> [AWS\_RDS\_PASSWORD](#input\_AWS\_RDS\_PASSWORD) | AWS RDS generic root password | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->