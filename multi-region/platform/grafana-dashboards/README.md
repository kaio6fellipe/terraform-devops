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
| <a name="module_ec2-instance"></a> [ec2-instance](#module\_ec2-instance) | terraform-aws-modules/ec2-instance/aws | 4.1.1 |
| <a name="module_grafana_rds"></a> [grafana\_rds](#module\_grafana\_rds) | terraform-aws-modules/rds/aws | 5.0.3 |
| <a name="module_sg_grafana_db"></a> [sg\_grafana\_db](#module\_sg\_grafana\_db) | terraform-aws-modules/security-group/aws | 4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.grafana_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_ansible_admin_subnet_ssh"></a> [allow\_ansible\_admin\_subnet\_ssh](#input\_allow\_ansible\_admin\_subnet\_ssh) | n/a | `any` | n/a | yes |
| <a name="input_allow_bastion_ssh"></a> [allow\_bastion\_ssh](#input\_allow\_bastion\_ssh) | n/a | `any` | n/a | yes |
| <a name="input_allow_outbound"></a> [allow\_outbound](#input\_allow\_outbound) | n/a | `any` | n/a | yes |
| <a name="input_allow_ping"></a> [allow\_ping](#input\_allow\_ping) | n/a | `any` | n/a | yes |
| <a name="input_amazon_linux_2"></a> [amazon\_linux\_2](#input\_amazon\_linux\_2) | n/a | `any` | n/a | yes |
| <a name="input_availability_zone_0"></a> [availability\_zone\_0](#input\_availability\_zone\_0) | n/a | `any` | n/a | yes |
| <a name="input_cdirs_acesso_remoto"></a> [cdirs\_acesso\_remoto](#input\_cdirs\_acesso\_remoto) | n/a | `any` | n/a | yes |
| <a name="input_database_subnet_id_0"></a> [database\_subnet\_id\_0](#input\_database\_subnet\_id\_0) | n/a | `any` | n/a | yes |
| <a name="input_db_instance_type"></a> [db\_instance\_type](#input\_db\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | n/a | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | n/a | yes |
| <a name="input_public_subnet_id_0"></a> [public\_subnet\_id\_0](#input\_public\_subnet\_id\_0) | n/a | `any` | n/a | yes |
| <a name="input_rds_allocated_storage"></a> [rds\_allocated\_storage](#input\_rds\_allocated\_storage) | n/a | `any` | n/a | yes |
| <a name="input_rds_max_allocated_storage"></a> [rds\_max\_allocated\_storage](#input\_rds\_max\_allocated\_storage) | n/a | `any` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->