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
| [aws_codedeploy_app.ansible](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_app) | resource |
| [aws_codedeploy_deployment_config.ansible](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_deployment_config) | resource |
| [aws_codedeploy_deployment_group.ansible](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_deployment_group) | resource |
| [aws_codepipeline.codepipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |
| [aws_iam_openid_connect_provider.github_actions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.codedeploy_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.codepipeline_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.github_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.codepipeline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.github_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.AWSCodeDeployRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_alias.key_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.ansible_bucket_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.codepipeline_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.codepipeline_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_versioning.codepipeline_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_SSH_PRIVATE_KEY"></a> [SSH\_PRIVATE\_KEY](#input\_SSH\_PRIVATE\_KEY) | n/a | `any` | n/a | yes |
| <a name="input_allow_bastion_ssh"></a> [allow\_bastion\_ssh](#input\_allow\_bastion\_ssh) | n/a | `any` | n/a | yes |
| <a name="input_allow_outbound"></a> [allow\_outbound](#input\_allow\_outbound) | n/a | `any` | n/a | yes |
| <a name="input_allow_ping"></a> [allow\_ping](#input\_allow\_ping) | n/a | `any` | n/a | yes |
| <a name="input_amazon_linux_2"></a> [amazon\_linux\_2](#input\_amazon\_linux\_2) | n/a | `any` | n/a | yes |
| <a name="input_ansible_instance_type"></a> [ansible\_instance\_type](#input\_ansible\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_ansible_repository"></a> [ansible\_repository](#input\_ansible\_repository) | n/a | `string` | `"kaio6fellipe/ansible-devops"` | no |
| <a name="input_availability_zone_0"></a> [availability\_zone\_0](#input\_availability\_zone\_0) | n/a | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | n/a | yes |
| <a name="input_private_subnet_id_0"></a> [private\_subnet\_id\_0](#input\_private\_subnet\_id\_0) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ansible_private_ipv4"></a> [ansible\_private\_ipv4](#output\_ansible\_private\_ipv4) | n/a |
<!-- END_TF_DOCS -->