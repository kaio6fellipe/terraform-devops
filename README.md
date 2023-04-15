# A project to practice Terraform 

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=kaio6fellipe_terraform-devops&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=kaio6fellipe_terraform-devops)
[![Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=kaio6fellipe_terraform-devops&metric=ncloc)](https://sonarcloud.io/summary/new_code?id=kaio6fellipe_terraform-devops)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=kaio6fellipe_terraform-devops&metric=security_rating)](https://sonarcloud.io/summary/new_code?id=kaio6fellipe_terraform-devops)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=kaio6fellipe_terraform-devops&metric=reliability_rating)](https://sonarcloud.io/summary/new_code?id=kaio6fellipe_terraform-devops)
![](https://img.shields.io/github/commit-activity/w/kaio6fellipe/terraform-devops)
  
| Env | Status |
|-----|--------|
| Development | ![Apply dev](https://github.com/kaio6fellipe/terraform-devops/actions/workflows/terraform-apply.yml/badge.svg) |

The remote state is being managed in the repository: [terraform-remote-state](https://github.com/kaio6fellipe/terraform-remote-state). Each environment has a separate remote state.

The configuration management is being performed by the "Ansible Controller" in the following repository: [ansible-devops](https://github.com/kaio6fellipe/ansible-devops).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.2.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.57.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_us-east-1"></a> [us-east-1](#module\_us-east-1) | ./stack/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ADMIN_USER_ARN"></a> [ADMIN\_USER\_ARN](#input\_ADMIN\_USER\_ARN) | EKS admin user ARN | `string` | n/a | yes |
| <a name="input_ADMIN_USER_NAME"></a> [ADMIN\_USER\_NAME](#input\_ADMIN\_USER\_NAME) | EKS admin user name | `string` | n/a | yes |
| <a name="input_ANSIBLE_VAULT_PASSWORD"></a> [ANSIBLE\_VAULT\_PASSWORD](#input\_ANSIBLE\_VAULT\_PASSWORD) | Ansible vault root password | `string` | n/a | yes |
| <a name="input_AWS_RDS_PASSWORD"></a> [AWS\_RDS\_PASSWORD](#input\_AWS\_RDS\_PASSWORD) | AWS RDS generic root password | `string` | n/a | yes |
| <a name="input_GITHUB_ACTIONS_CIDR"></a> [GITHUB\_ACTIONS\_CIDR](#input\_GITHUB\_ACTIONS\_CIDR) | GitHub Actions egress CIDR Block | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_SSH_PRIVATE_KEY"></a> [SSH\_PRIVATE\_KEY](#input\_SSH\_PRIVATE\_KEY) | SSH Private Key for Ansible Server (Controller) | `string` | n/a | yes |
| <a name="input_ansible_instance_type"></a> [ansible\_instance\_type](#input\_ansible\_instance\_type) | An instance type to the Ansible Server (Controller) | `string` | n/a | yes |
| <a name="input_database_subnet_a"></a> [database\_subnet\_a](#input\_database\_subnet\_a) | Database subnet in AZ (a) | `string` | n/a | yes |
| <a name="input_database_subnet_b"></a> [database\_subnet\_b](#input\_database\_subnet\_b) | Database subnet in AZ (b) | `string` | n/a | yes |
| <a name="input_database_subnet_c"></a> [database\_subnet\_c](#input\_database\_subnet\_c) | Database subnet in AZ (c) | `string` | n/a | yes |
| <a name="input_db_instance_type"></a> [db\_instance\_type](#input\_db\_instance\_type) | The default instance type to use in all RDS instances | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment variable passed to all the modules | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The default instance type to use in all the instances | `string` | n/a | yes |
| <a name="input_intra_subnet_a"></a> [intra\_subnet\_a](#input\_intra\_subnet\_a) | Intra Subnet in AZ (a) | `string` | n/a | yes |
| <a name="input_intra_subnet_b"></a> [intra\_subnet\_b](#input\_intra\_subnet\_b) | Intra Subnet in AZ (b) | `string` | n/a | yes |
| <a name="input_intra_subnet_c"></a> [intra\_subnet\_c](#input\_intra\_subnet\_c) | Intra Subnet in AZ (c) | `string` | n/a | yes |
| <a name="input_platform_eks_services"></a> [platform\_eks\_services](#input\_platform\_eks\_services) | Platform EKS cluster subnet (Services) | `string` | n/a | yes |
| <a name="input_private_subnet_a"></a> [private\_subnet\_a](#input\_private\_subnet\_a) | Private Subnet in AZ (a) | `string` | n/a | yes |
| <a name="input_private_subnet_b"></a> [private\_subnet\_b](#input\_private\_subnet\_b) | Private Subnet in AZ (b) | `string` | n/a | yes |
| <a name="input_private_subnet_c"></a> [private\_subnet\_c](#input\_private\_subnet\_c) | Private Subnet in AZ (c) | `string` | n/a | yes |
| <a name="input_public_subnet_a"></a> [public\_subnet\_a](#input\_public\_subnet\_a) | Public Subnet in AZ (a) | `string` | n/a | yes |
| <a name="input_public_subnet_b"></a> [public\_subnet\_b](#input\_public\_subnet\_b) | Public Subnet in AZ (a) | `string` | n/a | yes |
| <a name="input_public_subnet_c"></a> [public\_subnet\_c](#input\_public\_subnet\_c) | Public Subnet in AZ (c) | `string` | n/a | yes |
| <a name="input_rds_allocated_storage"></a> [rds\_allocated\_storage](#input\_rds\_allocated\_storage) | The default allocated storage to use in all RDS instances | `number` | n/a | yes |
| <a name="input_rds_max_allocated_storage"></a> [rds\_max\_allocated\_storage](#input\_rds\_max\_allocated\_storage) | The default max allocated storage to use in all RDS instances | `number` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC CIDR block | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
