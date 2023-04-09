<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.47 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.7 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.47 |
| <a name="provider_external"></a> [external](#provider\_external) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | 19.11.0 |
| <a name="module_vpc_cni_irsa"></a> [vpc\_cni\_irsa](#module\_vpc\_cni\_irsa) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [external_external.aws_eks_cluster_ca_certificate](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [external_external.aws_eks_cluster_endpoint](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [external_external.aws_eks_cluster_token](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ADMIN_USER_ARN"></a> [ADMIN\_USER\_ARN](#input\_ADMIN\_USER\_ARN) | n/a | `any` | n/a | yes |
| <a name="input_ADMIN_USER_NAME"></a> [ADMIN\_USER\_NAME](#input\_ADMIN\_USER\_NAME) | n/a | `any` | n/a | yes |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | n/a | `any` | n/a | yes |
| <a name="input_default_sg"></a> [default\_sg](#input\_default\_sg) | n/a | `any` | n/a | yes |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | n/a | `number` | `2` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `any` | n/a | yes |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | n/a | `list` | <pre>[<br>  "t3.small"<br>]</pre> | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `any` | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | When updating the Kubernetes version, also update the API and client-go version in test/src/go.mod | `string` | `"1.24"` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | n/a | `number` | `3` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | n/a | `number` | `2` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"platform-eks"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `any` | n/a | yes |
| <a name="input_vpc_private_subnets"></a> [vpc\_private\_subnets](#input\_vpc\_private\_subnets) | n/a | `any` | n/a | yes |
| <a name="input_vpc_public_subnets"></a> [vpc\_public\_subnets](#input\_vpc\_public\_subnets) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_current_identity_account_id"></a> [current\_identity\_account\_id](#output\_current\_identity\_account\_id) | n/a |
| <a name="output_current_identity_arn"></a> [current\_identity\_arn](#output\_current\_identity\_arn) | n/a |
<!-- END_TF_DOCS -->