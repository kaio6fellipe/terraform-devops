<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_external"></a> [external](#provider\_external) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_default_eks_managed_node_groups"></a> [default\_eks\_managed\_node\_groups](#module\_default\_eks\_managed\_node\_groups) | terraform-aws-modules/eks/aws//modules/eks-managed-node-group | 19.13.0 |

## Resources

| Name | Type |
|------|------|
| [external_external.aws_eks_cluster_ca_certificate](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [external_external.aws_eks_cluster_endpoint](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [external_external.aws_eks_cluster_token](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | n/a | `number` | `3` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | n/a | `list(string)` | <pre>[<br>  "t3.small",<br>  "t3.medium",<br>  "t3.xlarge"<br>]</pre> | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | n/a | `number` | `20` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | n/a | `number` | `3` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->