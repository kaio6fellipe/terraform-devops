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

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.goteleport_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.goteleport_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.goteleport_public_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

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
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | n/a | yes |
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | n/a | `any` | n/a | yes |
| <a name="input_private_dns_zone_name"></a> [private\_dns\_zone\_name](#input\_private\_dns\_zone\_name) | n/a | `any` | n/a | yes |
| <a name="input_public_dns_zone_id"></a> [public\_dns\_zone\_id](#input\_public\_dns\_zone\_id) | n/a | `any` | n/a | yes |
| <a name="input_public_dns_zone_name"></a> [public\_dns\_zone\_name](#input\_public\_dns\_zone\_name) | n/a | `any` | n/a | yes |
| <a name="input_public_subnet_id_0"></a> [public\_subnet\_id\_0](#input\_public\_subnet\_id\_0) | n/a | `any` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_goteleport_private_ipv4"></a> [goteleport\_private\_ipv4](#output\_goteleport\_private\_ipv4) | n/a |
| <a name="output_goteleport_public_ipv4"></a> [goteleport\_public\_ipv4](#output\_goteleport\_public\_ipv4) | n/a |
<!-- END_TF_DOCS -->