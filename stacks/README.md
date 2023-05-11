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

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_platform"></a> [platform](#module\_platform) | ./platform | n/a |
| <a name="module_stack-secrets-manager"></a> [stack-secrets-manager](#module\_stack-secrets-manager) | lgallard/secrets-manager/aws | 0.8.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.14.2 |
| <a name="module_zones"></a> [zones](#module\_zones) | terraform-aws-modules/route53/aws//modules/zones | 2.10.2 |

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.terraform-aws](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/key_pair) | resource |
| [aws_ami.amazon_linux_2](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/data-sources/ami) | data source |
| [aws_route53_zone.ktech_devops_private_zone](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/data-sources/route53_zone) | data source |
| [aws_route53_zone.private_zone](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ADMIN_USER_ARN"></a> [ADMIN\_USER\_ARN](#input\_ADMIN\_USER\_ARN) | EKS admin user ARN | `string` | n/a | yes |
| <a name="input_ADMIN_USER_NAME"></a> [ADMIN\_USER\_NAME](#input\_ADMIN\_USER\_NAME) | EKS admin user name | `string` | n/a | yes |
| <a name="input_ANSIBLE_VAULT_PASSWORD"></a> [ANSIBLE\_VAULT\_PASSWORD](#input\_ANSIBLE\_VAULT\_PASSWORD) | Ansible vault root password | `string` | n/a | yes |
| <a name="input_ARGO_GITHUB_SSO_SECRET_KEY"></a> [ARGO\_GITHUB\_SSO\_SECRET\_KEY](#input\_ARGO\_GITHUB\_SSO\_SECRET\_KEY) | GitHub SSO for ArgoCD Application | `string` | n/a | yes |
| <a name="input_AWS_RDS_PASSWORD"></a> [AWS\_RDS\_PASSWORD](#input\_AWS\_RDS\_PASSWORD) | AWS RDS generic root password | `string` | n/a | yes |
| <a name="input_CROSSPLANE_AWS_CREDENTIALS_CONTENT"></a> [CROSSPLANE\_AWS\_CREDENTIALS\_CONTENT](#input\_CROSSPLANE\_AWS\_CREDENTIALS\_CONTENT) | Crossplane AWS Credentials content file | `string` | n/a | yes |
| <a name="input_GITHUB_ACTIONS_CIDR"></a> [GITHUB\_ACTIONS\_CIDR](#input\_GITHUB\_ACTIONS\_CIDR) | GitHub Actions egress CIDR Block | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_SSH_PRIVATE_KEY"></a> [SSH\_PRIVATE\_KEY](#input\_SSH\_PRIVATE\_KEY) | SSH Private Key for Ansible Server (Controller) | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->