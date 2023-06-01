<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.2.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.57.1 |
| <a name="requirement_external"></a> [external](#requirement\_external) | 2.3.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.20.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.57.1 |
| <a name="provider_external"></a> [external](#provider\_external) | 2.3.1 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | 19.13.0 |
| <a name="module_vpc_cni_irsa"></a> [vpc\_cni\_irsa](#module\_vpc\_cni\_irsa) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/data-sources/caller_identity) | data source |
| [external_external.aws_eks_cluster_ca_certificate](https://registry.terraform.io/providers/hashicorp/external/2.3.1/docs/data-sources/external) | data source |
| [external_external.aws_eks_cluster_endpoint](https://registry.terraform.io/providers/hashicorp/external/2.3.1/docs/data-sources/external) | data source |
| [external_external.aws_eks_cluster_token](https://registry.terraform.io/providers/hashicorp/external/2.3.1/docs/data-sources/external) | data source |
| [terraform_remote_state.RnbMbZULGoHWEauYKXoSoXHIWT1lJ6yqBg0Y-platform](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-aws](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ADMIN_USER_ARN"></a> [ADMIN\_USER\_ARN](#input\_ADMIN\_USER\_ARN) | EKS admin user ARN | `string` | n/a | yes |
| <a name="input_ADMIN_USER_NAME"></a> [ADMIN\_USER\_NAME](#input\_ADMIN\_USER\_NAME) | EKS admin user name | `string` | n/a | yes |
| <a name="input_GITHUB_ACTIONS_CIDR"></a> [GITHUB\_ACTIONS\_CIDR](#input\_GITHUB\_ACTIONS\_CIDR) | GitHub Actions egress CIDR Block | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | n/a | `number` | `4` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | n/a | `list(string)` | <pre>[<br>  "t3.micro",<br>  "t3.small",<br>  "t3.medium",<br>  "t3.xlarge"<br>]</pre> | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | When updating the Kubernetes version, also update the API and client-go version in test/src/go.mod | `string` | `"1.25"` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | n/a | `number` | `40` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | n/a | `number` | `3` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"platform-eks"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#output\_cluster\_oidc\_issuer\_url) | n/a |
| <a name="output_cluster_primary_security_group_id"></a> [cluster\_primary\_security\_group\_id](#output\_cluster\_primary\_security\_group\_id) | n/a |
| <a name="output_cluster_security_group_id"></a> [cluster\_security\_group\_id](#output\_cluster\_security\_group\_id) | n/a |
| <a name="output_cluster_version"></a> [cluster\_version](#output\_cluster\_version) | n/a |
| <a name="output_current_identity_account_id"></a> [current\_identity\_account\_id](#output\_current\_identity\_account\_id) | n/a |
| <a name="output_current_identity_arn"></a> [current\_identity\_arn](#output\_current\_identity\_arn) | n/a |
| <a name="output_node_security_group_id"></a> [node\_security\_group\_id](#output\_node\_security\_group\_id) | n/a |
| <a name="output_oidc_provider"></a> [oidc\_provider](#output\_oidc\_provider) | n/a |
| <a name="output_oidc_provider_arn"></a> [oidc\_provider\_arn](#output\_oidc\_provider\_arn) | n/a |
<!-- END_TF_DOCS -->