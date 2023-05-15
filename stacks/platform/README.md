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
| [aws_security_group.default_ansible](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/security_group) | resource |
| [aws_security_group.default_bastion](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/security_group) | resource |
| [aws_security_group.default_platform](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/security_group) | resource |
| [aws_security_group_rule.ansible_egress](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ansible_ingress](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ansible_to_bastion_ssh](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.bastion_egress](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.bastion_ingress](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.bastion_to_ansible_ssh](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/resources/security_group_rule) | resource |
| [aws_ami.amazon_linux_2](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/data-sources/ami) | data source |
| [aws_route53_zone.ktech_public](https://registry.terraform.io/providers/hashicorp/aws/4.57.1/docs/data-sources/route53_zone) | data source |
| [terraform_remote_state.stacks](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidrs_remote_access"></a> [cidrs\_remote\_access](#input\_cidrs\_remote\_access) | Remote access CIDR for SGs in hosts associated with public subnets | `list(string)` | <pre>[<br>  "168.196.72.0/22",<br>  "45.239.100.0/22",<br>  "170.233.164.0/22",<br>  "201.131.68.0/22",<br>  "131.255.68.0/22",<br>  "201.33.192.0/20",<br>  "168.227.32.0/22",<br>  "186.209.64.0/20",<br>  "131.0.200.0/22",<br>  "143.255.232.0/22",<br>  "177.125.200.0/22",<br>  "191.253.32.0/21",<br>  "170.244.252.0/22",<br>  "163.116.224.0/24"<br>]</pre> | no |
| <a name="input_cidrs_uptime_robot_monitoring"></a> [cidrs\_uptime\_robot\_monitoring](#input\_cidrs\_uptime\_robot\_monitoring) | Remote monitoring CIDR for SGs in hosts associated with public subnets | `list(string)` | <pre>[<br>  "69.162.124.224/28",<br>  "63.143.42.240/28",<br>  "216.245.221.80/28",<br>  "208.115.199.16/28",<br>  "216.144.248.16/28",<br>  "104.131.107.63/32",<br>  "122.248.234.23/32",<br>  "128.199.195.156/32",<br>  "138.197.150.151/32",<br>  "139.59.173.249/32",<br>  "146.185.143.14/32",<br>  "159.203.30.41/32",<br>  "159.89.8.111/32",<br>  "165.227.83.148/32",<br>  "178.62.52.237/32",<br>  "18.221.56.27/32",<br>  "167.99.209.234/32",<br>  "216.144.250.150/32",<br>  "34.233.66.117/32",<br>  "46.101.250.135/32",<br>  "46.137.190.132/32",<br>  "52.60.129.180/32",<br>  "54.64.67.106/32",<br>  "54.67.10.127/32",<br>  "54.79.28.129/32",<br>  "54.94.142.218/32"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_amazon_linux_2"></a> [amazon\_linux\_2](#output\_amazon\_linux\_2) | n/a |
| <a name="output_ansible_default_sg"></a> [ansible\_default\_sg](#output\_ansible\_default\_sg) | n/a |
| <a name="output_bastion_default_sg"></a> [bastion\_default\_sg](#output\_bastion\_default\_sg) | n/a |
| <a name="output_cidrs_remote_access"></a> [cidrs\_remote\_access](#output\_cidrs\_remote\_access) | n/a |
| <a name="output_cidrs_uptime_robot_monitoring"></a> [cidrs\_uptime\_robot\_monitoring](#output\_cidrs\_uptime\_robot\_monitoring) | n/a |
| <a name="output_public_dns_zone_id"></a> [public\_dns\_zone\_id](#output\_public\_dns\_zone\_id) | n/a |
| <a name="output_public_dns_zone_name"></a> [public\_dns\_zone\_name](#output\_public\_dns\_zone\_name) | n/a |
<!-- END_TF_DOCS -->