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

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.mimir](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/iam_policy) | resource |
| [aws_iam_role.mimir](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.mimir-attach](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.mimir-alertmanager](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.mimir-blocks](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.mimir-ruler](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.grant-access-alertmanager](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_policy.grant-access-blocks](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_policy.grant-access-ruler](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.block-alertmanager](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.block-blocks](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.block-ruler](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_iam_policy_document.oidc](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/data-sources/iam_policy_document) | data source |
| [terraform_remote_state.PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_annotation"></a> [annotation](#output\_annotation) | Service account annotation |
<!-- END_TF_DOCS -->