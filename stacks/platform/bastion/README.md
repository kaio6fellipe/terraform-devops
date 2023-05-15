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
| [aws_route53_record.bastion_private](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/route53_record) | resource |
| [aws_route53_record.bastion_public](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/route53_record) | resource |
| [aws_security_group.bastion_public_ssh](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/security_group) | resource |
| [aws_security_group.bastion_uptimerobot_ssh](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/security_group) | resource |
| [terraform_remote_state.stacks](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.stacks_platform](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->