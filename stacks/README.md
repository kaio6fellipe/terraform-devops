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
| <a name="module_apps"></a> [apps](#module\_apps) | ./apps | n/a |
| <a name="module_platform"></a> [platform](#module\_platform) | ./platform | n/a |
| <a name="module_stack-secrets-manager"></a> [stack-secrets-manager](#module\_stack-secrets-manager) | lgallard/secrets-manager/aws | 0.8.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.14.2 |
| <a name="module_zones"></a> [zones](#module\_zones) | terraform-aws-modules/route53/aws//modules/zones | 2.10.2 |

## Resources

| Name | Type |
|------|------|
| [aws_default_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/default_vpc) | resource |
| [aws_key_pair.terraform-aws](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/key_pair) | resource |
| [aws_ami.amazon_linux_2](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/data-sources/ami) | data source |
| [aws_ami.ubuntu2004](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/data-sources/ami) | data source |
| [aws_availability_zones.az_zones](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/data-sources/availability_zones) | data source |
| [aws_route53_zone.ktech_devops_private_zone](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/data-sources/route53_zone) | data source |
| [aws_route53_zone.private_zone](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ADMIN_USER_ARN"></a> [ADMIN\_USER\_ARN](#input\_ADMIN\_USER\_ARN) | n/a | `any` | n/a | yes |
| <a name="input_ADMIN_USER_NAME"></a> [ADMIN\_USER\_NAME](#input\_ADMIN\_USER\_NAME) | n/a | `any` | n/a | yes |
| <a name="input_ANSIBLE_VAULT_PASSWORD"></a> [ANSIBLE\_VAULT\_PASSWORD](#input\_ANSIBLE\_VAULT\_PASSWORD) | Ansible vault root password | `string` | n/a | yes |
| <a name="input_ARGO_GITHUB_SSO_SECRET_KEY"></a> [ARGO\_GITHUB\_SSO\_SECRET\_KEY](#input\_ARGO\_GITHUB\_SSO\_SECRET\_KEY) | n/a | `any` | n/a | yes |
| <a name="input_AWS_RDS_PASSWORD"></a> [AWS\_RDS\_PASSWORD](#input\_AWS\_RDS\_PASSWORD) | AWS RDS generic root password | `string` | n/a | yes |
| <a name="input_CROSSPLANE_AWS_CREDENTIALS_CONTENT"></a> [CROSSPLANE\_AWS\_CREDENTIALS\_CONTENT](#input\_CROSSPLANE\_AWS\_CREDENTIALS\_CONTENT) | n/a | `any` | n/a | yes |
| <a name="input_GITHUB_ACTIONS_CIDR"></a> [GITHUB\_ACTIONS\_CIDR](#input\_GITHUB\_ACTIONS\_CIDR) | n/a | `any` | n/a | yes |
| <a name="input_SSH_PRIVATE_KEY"></a> [SSH\_PRIVATE\_KEY](#input\_SSH\_PRIVATE\_KEY) | SSH Private Key for Ansible Server (Controller) | `string` | n/a | yes |
| <a name="input_ansible_instance_type"></a> [ansible\_instance\_type](#input\_ansible\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_database_subnet_a"></a> [database\_subnet\_a](#input\_database\_subnet\_a) | n/a | `string` | n/a | yes |
| <a name="input_database_subnet_b"></a> [database\_subnet\_b](#input\_database\_subnet\_b) | n/a | `string` | n/a | yes |
| <a name="input_database_subnet_c"></a> [database\_subnet\_c](#input\_database\_subnet\_c) | n/a | `string` | n/a | yes |
| <a name="input_db_instance_type"></a> [db\_instance\_type](#input\_db\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_intra_subnet_a"></a> [intra\_subnet\_a](#input\_intra\_subnet\_a) | n/a | `string` | n/a | yes |
| <a name="input_intra_subnet_b"></a> [intra\_subnet\_b](#input\_intra\_subnet\_b) | n/a | `string` | n/a | yes |
| <a name="input_intra_subnet_c"></a> [intra\_subnet\_c](#input\_intra\_subnet\_c) | n/a | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Key name prefix | `string` | `"terraform-aws"` | no |
| <a name="input_platform_eks_services"></a> [platform\_eks\_services](#input\_platform\_eks\_services) | n/a | `string` | n/a | yes |
| <a name="input_private_subnet_a"></a> [private\_subnet\_a](#input\_private\_subnet\_a) | n/a | `string` | n/a | yes |
| <a name="input_private_subnet_b"></a> [private\_subnet\_b](#input\_private\_subnet\_b) | n/a | `string` | n/a | yes |
| <a name="input_private_subnet_c"></a> [private\_subnet\_c](#input\_private\_subnet\_c) | n/a | `string` | n/a | yes |
| <a name="input_public_subnet_a"></a> [public\_subnet\_a](#input\_public\_subnet\_a) | n/a | `string` | n/a | yes |
| <a name="input_public_subnet_b"></a> [public\_subnet\_b](#input\_public\_subnet\_b) | n/a | `string` | n/a | yes |
| <a name="input_public_subnet_c"></a> [public\_subnet\_c](#input\_public\_subnet\_c) | n/a | `string` | n/a | yes |
| <a name="input_rds_allocated_storage"></a> [rds\_allocated\_storage](#input\_rds\_allocated\_storage) | n/a | `any` | n/a | yes |
| <a name="input_rds_max_allocated_storage"></a> [rds\_max\_allocated\_storage](#input\_rds\_max\_allocated\_storage) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->