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
| <a name="module_ansible_server"></a> [ansible\_server](#module\_ansible\_server) | ./ansible-server | n/a |
| <a name="module_bastion"></a> [bastion](#module\_bastion) | ./bastion | n/a |
| <a name="module_platform_k8s"></a> [platform\_k8s](#module\_platform\_k8s) | ./platform-k8s | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.default_ansible](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.default_bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.default_platform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_route53_zone.ktech_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ADMIN_USER_ARN"></a> [ADMIN\_USER\_ARN](#input\_ADMIN\_USER\_ARN) | n/a | `any` | n/a | yes |
| <a name="input_ADMIN_USER_NAME"></a> [ADMIN\_USER\_NAME](#input\_ADMIN\_USER\_NAME) | n/a | `any` | n/a | yes |
| <a name="input_ANSIBLE_VAULT_PASSWORD"></a> [ANSIBLE\_VAULT\_PASSWORD](#input\_ANSIBLE\_VAULT\_PASSWORD) | n/a | `any` | n/a | yes |
| <a name="input_AWS_RDS_PASSWORD"></a> [AWS\_RDS\_PASSWORD](#input\_AWS\_RDS\_PASSWORD) | n/a | `any` | n/a | yes |
| <a name="input_GITHUB_ACTIONS_CIDR"></a> [GITHUB\_ACTIONS\_CIDR](#input\_GITHUB\_ACTIONS\_CIDR) | n/a | `any` | n/a | yes |
| <a name="input_SSH_PRIVATE_KEY"></a> [SSH\_PRIVATE\_KEY](#input\_SSH\_PRIVATE\_KEY) | n/a | `any` | n/a | yes |
| <a name="input_amazon_linux_2"></a> [amazon\_linux\_2](#input\_amazon\_linux\_2) | n/a | `any` | n/a | yes |
| <a name="input_ansible_instance_type"></a> [ansible\_instance\_type](#input\_ansible\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_availability_zone_0"></a> [availability\_zone\_0](#input\_availability\_zone\_0) | n/a | `any` | n/a | yes |
| <a name="input_availability_zone_1"></a> [availability\_zone\_1](#input\_availability\_zone\_1) | n/a | `any` | n/a | yes |
| <a name="input_availability_zone_2"></a> [availability\_zone\_2](#input\_availability\_zone\_2) | n/a | `any` | n/a | yes |
| <a name="input_cdirs_acesso_remoto"></a> [cdirs\_acesso\_remoto](#input\_cdirs\_acesso\_remoto) | Remote access CIDR for SGs in hosts associated with public subnets | `list` | <pre>[<br>  "168.196.72.0/22",<br>  "45.239.100.0/22",<br>  "170.233.164.0/22",<br>  "201.131.68.0/22",<br>  "131.255.68.0/22",<br>  "201.33.192.0/20",<br>  "168.227.32.0/22",<br>  "186.209.64.0/20",<br>  "131.0.200.0/22",<br>  "143.255.232.0/22",<br>  "177.125.200.0/22",<br>  "191.253.32.0/21",<br>  "170.244.252.0/22",<br>  "163.116.224.0/24"<br>]</pre> | no |
| <a name="input_cdirs_uptime_robot_monitoring"></a> [cdirs\_uptime\_robot\_monitoring](#input\_cdirs\_uptime\_robot\_monitoring) | Remote monitoring CIDR for SGs in hosts associated with public subnets | `list` | <pre>[<br>  "69.162.124.224/28",<br>  "63.143.42.240/28",<br>  "216.245.221.80/28",<br>  "208.115.199.16/28",<br>  "216.144.248.16/28",<br>  "104.131.107.63/32",<br>  "122.248.234.23/32",<br>  "128.199.195.156/32",<br>  "138.197.150.151/32",<br>  "139.59.173.249/32",<br>  "146.185.143.14/32",<br>  "159.203.30.41/32",<br>  "159.89.8.111/32",<br>  "165.227.83.148/32",<br>  "178.62.52.237/32",<br>  "18.221.56.27/32",<br>  "167.99.209.234/32",<br>  "216.144.250.150/32",<br>  "34.233.66.117/32",<br>  "46.101.250.135/32",<br>  "46.137.190.132/32",<br>  "52.60.129.180/32",<br>  "54.64.67.106/32",<br>  "54.67.10.127/32",<br>  "54.79.28.129/32",<br>  "54.94.142.218/32"<br>]</pre> | no |
| <a name="input_database_subnet_id_0"></a> [database\_subnet\_id\_0](#input\_database\_subnet\_id\_0) | n/a | `any` | n/a | yes |
| <a name="input_db_instance_type"></a> [db\_instance\_type](#input\_db\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | n/a | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Key name prefix | `string` | n/a | yes |
| <a name="input_ktech_devops_private_zone_id"></a> [ktech\_devops\_private\_zone\_id](#input\_ktech\_devops\_private\_zone\_id) | n/a | `any` | n/a | yes |
| <a name="input_platform_eks_services"></a> [platform\_eks\_services](#input\_platform\_eks\_services) | n/a | `any` | n/a | yes |
| <a name="input_private_dns_zone_arn"></a> [private\_dns\_zone\_arn](#input\_private\_dns\_zone\_arn) | n/a | `any` | n/a | yes |
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | n/a | `any` | n/a | yes |
| <a name="input_private_dns_zone_name"></a> [private\_dns\_zone\_name](#input\_private\_dns\_zone\_name) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_cidr_block_0"></a> [private\_subnet\_cidr\_block\_0](#input\_private\_subnet\_cidr\_block\_0) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_id_0"></a> [private\_subnet\_id\_0](#input\_private\_subnet\_id\_0) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_id_1"></a> [private\_subnet\_id\_1](#input\_private\_subnet\_id\_1) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_id_2"></a> [private\_subnet\_id\_2](#input\_private\_subnet\_id\_2) | n/a | `any` | n/a | yes |
| <a name="input_public_subnet_id_0"></a> [public\_subnet\_id\_0](#input\_public\_subnet\_id\_0) | n/a | `any` | n/a | yes |
| <a name="input_public_subnet_id_1"></a> [public\_subnet\_id\_1](#input\_public\_subnet\_id\_1) | n/a | `any` | n/a | yes |
| <a name="input_public_subnet_id_2"></a> [public\_subnet\_id\_2](#input\_public\_subnet\_id\_2) | n/a | `any` | n/a | yes |
| <a name="input_rds_allocated_storage"></a> [rds\_allocated\_storage](#input\_rds\_allocated\_storage) | n/a | `any` | n/a | yes |
| <a name="input_rds_max_allocated_storage"></a> [rds\_max\_allocated\_storage](#input\_rds\_max\_allocated\_storage) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `any` | n/a | yes |
| <a name="input_vpc_intra_subnets"></a> [vpc\_intra\_subnets](#input\_vpc\_intra\_subnets) | n/a | `any` | n/a | yes |
| <a name="input_vpc_private_subnets"></a> [vpc\_private\_subnets](#input\_vpc\_private\_subnets) | n/a | `any` | n/a | yes |
| <a name="input_vpc_public_subnets"></a> [vpc\_public\_subnets](#input\_vpc\_public\_subnets) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->