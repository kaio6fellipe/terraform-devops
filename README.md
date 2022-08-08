# A project to practice Terraform

| Env | Status |
|-----|--------|
| Development | ![Apply dev](https://github.com/kaio6fellipe/terraform-devops/actions/workflows/dev-terraform-apply.yml/badge.svg) ![Plan dev](https://github.com/kaio6fellipe/terraform-devops/actions/workflows/dev-terraform-plan.yml/badge.svg) ![Destroy dev](https://github.com/kaio6fellipe/terraform-devops/actions/workflows/dev-terraform-destroy.yml/badge.svg) |
| Staging | ![Apply staging](https://github.com/kaio6fellipe/terraform-devops/actions/workflows/staging-terraform-apply.yml/badge.svg) ![Plan staging](https://github.com/kaio6fellipe/terraform-devops/actions/workflows/staging-terraform-plan.yml/badge.svg) ![Destroy staging](https://github.com/kaio6fellipe/terraform-devops/actions/workflows/staging-terraform-destroy.yml/badge.svg) |
| Production | ![Apply prod](https://github.com/kaio6fellipe/terraform-devops/actions/workflows/prod-terraform-apply.yml/badge.svg) ![Plan prod](https://github.com/kaio6fellipe/terraform-devops/actions/workflows/prod-terraform-plan.yml/badge.svg) ![Destroy prod](https://github.com/kaio6fellipe/terraform-devops/actions/workflows/prod-terraform-destroy.yml/badge.svg) |

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
| <a name="input_SSH_PRIVATE_KEY"></a> [SSH\_PRIVATE\_KEY](#input\_SSH\_PRIVATE\_KEY) | n/a | `any` | n/a | yes |
| <a name="input_ansible_instance_type"></a> [ansible\_instance\_type](#input\_ansible\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_private_subnet_a"></a> [private\_subnet\_a](#input\_private\_subnet\_a) | n/a | `string` | n/a | yes |
| <a name="input_private_subnet_b"></a> [private\_subnet\_b](#input\_private\_subnet\_b) | n/a | `string` | n/a | yes |
| <a name="input_private_subnet_c"></a> [private\_subnet\_c](#input\_private\_subnet\_c) | n/a | `string` | n/a | yes |
| <a name="input_public_subnet_a"></a> [public\_subnet\_a](#input\_public\_subnet\_a) | n/a | `string` | n/a | yes |
| <a name="input_public_subnet_b"></a> [public\_subnet\_b](#input\_public\_subnet\_b) | n/a | `string` | n/a | yes |
| <a name="input_public_subnet_c"></a> [public\_subnet\_c](#input\_public\_subnet\_c) | n/a | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
