# A project to practice Terraform.

| Env | Status |
|-----|--------|
| Development | ![Apply dev](https://github.com/kaio6fellipe/terraform-devops/actions/workflows/dev-terraform-apply.yml/badge.svg) |
| Staging | ![Apply staging](https://github.com/kaio6fellipe/terraform-devops/actions/workflows/staging-terraform-apply.yml/badge.svg) |
| Production | ![Apply prod](https://github.com/kaio6fellipe/terraform-devops/actions/workflows/prod-terraform-apply.yml/badge.svg) |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.2.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.22.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_apps"></a> [apps](#module\_apps) | ./apps/ | n/a |
| <a name="module_platform"></a> [platform](#module\_platform) | ./platform/ | n/a |
| <a name="module_us-east-1"></a> [us-east-1](#module\_us-east-1) | ./multi-region/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_SSH_PRIVATE_KEY"></a> [SSH\_PRIVATE\_KEY](#input\_SSH\_PRIVATE\_KEY) | SSH Private Key for Ansible Server (Controller) | `string` | n/a | yes |
| <a name="input_ansible_instance_type"></a> [ansible\_instance\_type](#input\_ansible\_instance\_type) | An instance type to the Ansible Server (Controller) | `string` | n/a | yes |
| <a name="input_database_subnet_a"></a> [database\_subnet\_a](#input\_database\_subnet\_a) | Database subnet in AZ (a) | `string` | n/a | yes |
| <a name="input_database_subnet_b"></a> [database\_subnet\_b](#input\_database\_subnet\_b) | Database subnet in AZ (b) | `string` | n/a | yes |
| <a name="input_database_subnet_c"></a> [database\_subnet\_c](#input\_database\_subnet\_c) | Database subnet in AZ (c) | `string` | n/a | yes |
| <a name="input_db_instance_type"></a> [db\_instance\_type](#input\_db\_instance\_type) | The default instance type to use in all RDS instances | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment variable passed to all the modules | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The default instance type to use in all the instances | `string` | n/a | yes |
| <a name="input_private_subnet_a"></a> [private\_subnet\_a](#input\_private\_subnet\_a) | Private Subnet in AZ (a) | `string` | n/a | yes |
| <a name="input_private_subnet_b"></a> [private\_subnet\_b](#input\_private\_subnet\_b) | Private Subnet in AZ (b) | `string` | n/a | yes |
| <a name="input_private_subnet_c"></a> [private\_subnet\_c](#input\_private\_subnet\_c) | Private Subnet in AZ (c) | `string` | n/a | yes |
| <a name="input_public_subnet_a"></a> [public\_subnet\_a](#input\_public\_subnet\_a) | Public Subnet in AZ (a) | `string` | n/a | yes |
| <a name="input_public_subnet_b"></a> [public\_subnet\_b](#input\_public\_subnet\_b) | Public Subnet in AZ (a) | `string` | n/a | yes |
| <a name="input_public_subnet_c"></a> [public\_subnet\_c](#input\_public\_subnet\_c) | Public Subnet in AZ (c) | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC CIDR block | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
