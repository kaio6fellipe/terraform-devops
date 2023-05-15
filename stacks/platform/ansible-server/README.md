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
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2-instance"></a> [ec2-instance](#module\_ec2-instance) | terraform-aws-modules/ec2-instance/aws | 4.1.1 |

## Resources

| Name | Type |
|------|------|
| [aws_codedeploy_app.ansible](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/codedeploy_app) | resource |
| [aws_codedeploy_deployment_config.ansible](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/codedeploy_deployment_config) | resource |
| [aws_codedeploy_deployment_group.ansible](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/codedeploy_deployment_group) | resource |
| [aws_codepipeline.codepipeline](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/codepipeline) | resource |
| [aws_iam_instance_profile.ansible_ec2_profile](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/iam_instance_profile) | resource |
| [aws_iam_openid_connect_provider.github_actions](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.ansible_ec2_role](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/iam_role) | resource |
| [aws_iam_role.codedeploy_role](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/iam_role) | resource |
| [aws_iam_role.codepipeline_role](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/iam_role) | resource |
| [aws_iam_role.github_role](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.ansible_ec2_policy](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.ansible_ec2_policy_inventory](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.codepipeline_policy](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.github_policy](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.AWSCodeDeployRole](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_alias.key_alias](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/kms_alias) | resource |
| [aws_kms_key.ansible_bucket_key](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/kms_key) | resource |
| [aws_route53_record.ansible_private](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/route53_record) | resource |
| [aws_s3_bucket.codepipeline_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.codepipeline_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_ownership_controls.codepipeline_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_public_access_block.block](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.codepipeline_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.codepipeline_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/s3_bucket_versioning) | resource |
| [aws_security_group.egress_ping](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/security_group) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/data-sources/caller_identity) | data source |
| [terraform_remote_state.stacks](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.stacks_platform](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ANSIBLE_VAULT_PASSWORD"></a> [ANSIBLE\_VAULT\_PASSWORD](#input\_ANSIBLE\_VAULT\_PASSWORD) | Ansible vault root password | `string` | n/a | yes |
| <a name="input_SSH_PRIVATE_KEY"></a> [SSH\_PRIVATE\_KEY](#input\_SSH\_PRIVATE\_KEY) | SSH Private Key for Ansible Server (Controller) | `string` | n/a | yes |
| <a name="input_ansible_repository"></a> [ansible\_repository](#input\_ansible\_repository) | n/a | `string` | `"kaio6fellipe/ansible-devops"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->