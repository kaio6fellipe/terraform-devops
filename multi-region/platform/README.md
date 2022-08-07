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
| <a name="module_ansible_server"></a> [ansible\_server](#module\_ansible\_server) | ./ansible-server | n/a |
| <a name="module_bastion"></a> [bastion](#module\_bastion) | ./bastion | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.allow_ansible_admin_subnet_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.allow_bastion_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ansible_instance_type"></a> [ansible\_instance\_type](#input\_ansible\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_availability_zone_0"></a> [availability\_zone\_0](#input\_availability\_zone\_0) | n/a | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | n/a | yes |
| <a name="input_private_subnet_cidr_block_0"></a> [private\_subnet\_cidr\_block\_0](#input\_private\_subnet\_cidr\_block\_0) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_id_0"></a> [private\_subnet\_id\_0](#input\_private\_subnet\_id\_0) | n/a | `any` | n/a | yes |
| <a name="input_public_subnet_id_0"></a> [public\_subnet\_id\_0](#input\_public\_subnet\_id\_0) | n/a | `any` | n/a | yes |
| <a name="input_ubuntu2004_id"></a> [ubuntu2004\_id](#input\_ubuntu2004\_id) | n/a | `any` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->