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

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_stack-secrets-manager"></a> [stack-secrets-manager](#module\_stack-secrets-manager) | lgallard/secrets-manager/aws | 0.8.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.14.2 |
| <a name="module_zones"></a> [zones](#module\_zones) | terraform-aws-modules/route53/aws//modules/zones | 2.10.2 |

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.terraform-aws](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/key_pair) | resource |
| [aws_route53_zone.ktech_devops_private_zone](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/data-sources/route53_zone) | data source |
| [aws_route53_zone.private_zone](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ARGO_GITHUB_SSO_SECRET_KEY"></a> [ARGO\_GITHUB\_SSO\_SECRET\_KEY](#input\_ARGO\_GITHUB\_SSO\_SECRET\_KEY) | GitHub SSO for ArgoCD Application | `string` | n/a | yes |
| <a name="input_CROSSPLANE_AWS_CREDENTIALS_CONTENT"></a> [CROSSPLANE\_AWS\_CREDENTIALS\_CONTENT](#input\_CROSSPLANE\_AWS\_CREDENTIALS\_CONTENT) | Crossplane AWS Credentials content file | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_availability_zone_0"></a> [availability\_zone\_0](#output\_availability\_zone\_0) | n/a |
| <a name="output_availability_zone_1"></a> [availability\_zone\_1](#output\_availability\_zone\_1) | n/a |
| <a name="output_availability_zone_2"></a> [availability\_zone\_2](#output\_availability\_zone\_2) | n/a |
| <a name="output_database_subnet_id_0"></a> [database\_subnet\_id\_0](#output\_database\_subnet\_id\_0) | n/a |
| <a name="output_db_subnet_group_name"></a> [db\_subnet\_group\_name](#output\_db\_subnet\_group\_name) | n/a |
| <a name="output_ktech_devops_private_zone_id"></a> [ktech\_devops\_private\_zone\_id](#output\_ktech\_devops\_private\_zone\_id) | n/a |
| <a name="output_private_dns_zone_arn"></a> [private\_dns\_zone\_arn](#output\_private\_dns\_zone\_arn) | n/a |
| <a name="output_private_dns_zone_id"></a> [private\_dns\_zone\_id](#output\_private\_dns\_zone\_id) | n/a |
| <a name="output_private_dns_zone_name"></a> [private\_dns\_zone\_name](#output\_private\_dns\_zone\_name) | n/a |
| <a name="output_private_subnet_cidr_block_0"></a> [private\_subnet\_cidr\_block\_0](#output\_private\_subnet\_cidr\_block\_0) | n/a |
| <a name="output_private_subnet_id_0"></a> [private\_subnet\_id\_0](#output\_private\_subnet\_id\_0) | n/a |
| <a name="output_private_subnet_id_1"></a> [private\_subnet\_id\_1](#output\_private\_subnet\_id\_1) | n/a |
| <a name="output_private_subnet_id_2"></a> [private\_subnet\_id\_2](#output\_private\_subnet\_id\_2) | n/a |
| <a name="output_public_subnet_id_0"></a> [public\_subnet\_id\_0](#output\_public\_subnet\_id\_0) | n/a |
| <a name="output_public_subnet_id_1"></a> [public\_subnet\_id\_1](#output\_public\_subnet\_id\_1) | n/a |
| <a name="output_public_subnet_id_2"></a> [public\_subnet\_id\_2](#output\_public\_subnet\_id\_2) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
| <a name="output_vpc_intra_subnets"></a> [vpc\_intra\_subnets](#output\_vpc\_intra\_subnets) | n/a |
| <a name="output_vpc_private_subnets"></a> [vpc\_private\_subnets](#output\_vpc\_private\_subnets) | n/a |
| <a name="output_vpc_public_subnets"></a> [vpc\_public\_subnets](#output\_vpc\_public\_subnets) | n/a |
<!-- END_TF_DOCS -->