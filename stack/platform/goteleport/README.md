# [[Teleport]] [[Terraform]] AWS AMI Simple Example

This is a simple Terraform example to get you started provisioning an all-in-one Teleport cluster (auth, node, proxy) on a single ec2 instance based on Teleport's pre-built AMI.

Do not use this in production! This example should be used for demo, proof-of-concept, or learning purposes only.

## How does this work?

Teleport AMIs are built so you only need to specify environment variables to bring a fully configured instance online. See `data.tpl` or our [documentation](https://goteleport.com/docs/deploy-a-cluster/deployments/aws-terraform/#set-up-variables) to learn more about supported environment variables.

A series of systemd [units](https://github.com/gravitational/teleport/tree/master/assets/aws/files/system) bootstrap the instance, via several bash [scripts](https://github.com/gravitational/teleport/tree/master/assets/aws/files/bin).

While this may not be sufficient for all use cases, it's a great proof-of-concept that you can fork and customize to your liking. Check out our AWS AMI [generation code](https://github.com/gravitational/teleport/tree/master/assets/aws) if you're interested in adapting this to your requirements.

This Terraform example will configure the following AWS resources:

- Teleport all-in-one (auth, node, proxy) single cluster ec2 instance
- DynamoDB tables (cluster state, cluster events, ssl lock)
- S3 bucket (session recording storage)
- Route53 `A` record
- Security Groups and IAM roles

## Instructions

### Build Requirements

- terraform v1.0+ [install docs](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- awscli v1.14+ [install docs](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

### Usage

- `make plan` and verify the plan is building what you expect.
- `make apply` to begin provisioning.
- `make destroy` to delete the provisioned resources.

### Project layout

File           | Description
-------------- | ---------------------------------------------------------------------------------------------
cluster.tf     | EC2 instance template and provisioning.
cluster_iam.tf | IAM role provisioning. Permits ec2 instance to talk to AWS resources (ssm, s3, dynamodb, etc)
cluster_sg.tf  | Security Group provisioning. Ingress network rules.
data.tf        | Misc variables used for provisioning AWS resources.
data.tpl       | Template for Teleport configuration.
dynamo.tf      | DynamoDB table provisioning. Tables used for Teleport state and events.
route53.tpl    | Route53 zone creation. Requires a hosted zone to configure SSL.
s3.tf          | S3 bucket provisioning. Bucket used for session recording storage.
ssm.tf         | Teleport license distribution (if using Teleport enterprise).
vars.tf        | Inbound variables for Teleport configuration.

### Steps

Update the included Makefile to define your configuration.

1. Run `make apply`.
2. SSH to your new instance. `ssh ec2-user@<cluster_domain>`.
3. Create a user (this will create a Teleport User and permit login as the local ec2-user).
   - OSS:
   `tctl users add <username> ec2-user`
   - Enterprise (requires a role):
    `tctl users add --roles=admin <username> --logins=ec2-user`
4. Click the registration link provided by the output. Set a password and configure your 2fa token.
5. Success! You've configured a fully functional Teleport cluster.

```bash
# Set up Terraform variables in a separate environment file, or inline here

# Region to run in - we currently have AMIs in the following regions:
# ap-south-1, ap-northeast-2, ap-southeast-1, ap-southeast-2, ap-northeast-1, ca-central-1, eu-central-1, eu-west-1, eu-west-2
# sa-east-1, us-east-1, us-east-2, us-west-1, us-west-2
TF_VAR_region ?= "us-east-1"

# Cluster name is a unique cluster name to use, should be unique and not contain spaces or other special characters
TF_VAR_cluster_name ?= "TeleportCluster1"

# AWS SSH key pair name to provision in installed instances, must be a key pair available in the above defined region (AWS Console > EC2 > Key Pairs)
TF_VAR_key_name ?= "example"

# Full absolute path to the license file, on the machine executing Terraform, for Teleport Enterprise.
# This license will be copied into AWS SSM and then pulled down on the auth nodes to enable Enterprise functionality
TF_VAR_license_path ?= "/path/to/license"

# AMI name contains the version of Teleport to install, and whether to use OSS or Enterprise version
# These AMIs are published by Teleport and shared as public whenever a new version of Teleport is released
# To list available AMIs:
# OSS: aws ec2 describe-images --owners 126027368216 --filters 'Name=name,Values=gravitational-teleport-ami-oss*'
# Enterprise: aws ec2 describe-images --owners 126027368216 --filters 'Name=name,Values=gravitational-teleport-ami-ent*'
# FIPS 140-2 images are also available for Enterprise customers, look for '-fips' on the end of the AMI's name
TF_VAR_ami_name ?= "gravitational-teleport-ami-ent-11.0.1"

# Route 53 hosted zone to use, must be a root zone registered in AWS, e.g. example.com
TF_VAR_route53_zone ?= "example.com"

# Subdomain to set up in the zone above, e.g. cluster.example.com
# This will be used for users connecting to Teleport proxy
TF_VAR_route53_domain ?= "cluster.example.com"

# Set to true to add a wildcard subdomain entry to point to the proxy, e.g. *.cluster.example.com
# This is used to enable Teleport Application Access
export TF_VAR_add_wildcard_route53_record="true"

# Enable adding MongoDB listeners in Teleport proxy, load balancer ports, and security groups
export TF_VAR_enable_mongodb_listener="true"

# Enable adding MySQL listeners in Teleport proxy, load balancer ports, and security groups
export TF_VAR_enable_mysql_listener="true"

# Enable adding Postgres listeners in Teleport proxy, load balancer ports, and security groups
export TF_VAR_enable_postgres_listener="true"

# Bucket name to store encrypted Let's Encrypt certificates.
TF_VAR_s3_bucket_name ?= "teleport.example.com"

# Email to be used for Let's Encrypt certificate registration process.
TF_VAR_email ?= "support@example.com"

# Set to true to use Let's Encrypt to provision certificates
TF_VAR_use_letsencrypt ?= true

# Set to true to use ACM (Amazon Certificate Manager) to provision certificates
# If you wish to use a pre-existing ACM certificate rather than having Terraform generate one for you, you can import it:
# terraform import aws_acm_certificate.cert <certificate_arn>
TF_VAR_use_acm ?= false

# plan
make plan
```

## Public Teleport AMI IDs

Please [see the AMIS.md file](../AMIS.md) for a list of public Teleport AMI IDs that you can use.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.teleport](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_dynamodb_table.teleport_events](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_dynamodb_table.teleport_locks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_iam_instance_profile.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.cluster_dynamo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.cluster_route53](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.cluster_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.cluster_ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_instance.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_route53_record.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.wildcard-cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_s3_bucket.storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_public_access_block.storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_security_group.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.cluster_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.cluster_ingress_mongodb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.cluster_ingress_mysql](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.cluster_ingress_postgres](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.cluster_ingress_services](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.cluster_ingress_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.cluster_ingress_web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_ssm_parameter.license](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ami.base](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_kms_alias.ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_alias) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_route53_zone.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_wildcard_route53_record"></a> [add\_wildcard\_route53\_record](#input\_add\_wildcard\_route53\_record) | Whether to add a wildcard entry *.proxy.example.com for application access | `bool` | `true` | no |
| <a name="input_ami_name"></a> [ami\_name](#input\_ami\_name) | AMI name to use | `string` | `"gravitational-teleport-ami-oss-11.0.1"` | no |
| <a name="input_cdirs_acesso_remoto"></a> [cdirs\_acesso\_remoto](#input\_cdirs\_acesso\_remoto) | n/a | `any` | n/a | yes |
| <a name="input_default_sg"></a> [default\_sg](#input\_default\_sg) | n/a | `any` | n/a | yes |
| <a name="input_email"></a> [email](#input\_email) | Email for Let's Encrypt domain registration | `string` | `"kaio6fellipe@gmail.com.br"` | no |
| <a name="input_enable_mongodb_listener"></a> [enable\_mongodb\_listener](#input\_enable\_mongodb\_listener) | whether to enable the mongodb listener adds security group setting, maps load balancer to port, and adds to teleport config | `bool` | `false` | no |
| <a name="input_enable_mysql_listener"></a> [enable\_mysql\_listener](#input\_enable\_mysql\_listener) | whether to enable the mysql listener adds security group setting, maps load balancer to port, and adds to teleport config | `bool` | `false` | no |
| <a name="input_enable_postgres_listener"></a> [enable\_postgres\_listener](#input\_enable\_postgres\_listener) | whether to enable the postgres listener adds security group setting, maps load balancer to port, and adds to teleport config | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `any` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type for cluster | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | SSH key name to provision instances with | `string` | n/a | yes |
| <a name="input_kms_alias_name"></a> [kms\_alias\_name](#input\_kms\_alias\_name) | n/a | `string` | `"alias/aws/ssm"` | no |
| <a name="input_license_path"></a> [license\_path](#input\_license\_path) | Path to Teleport Enterprise license file | `string` | `"/var/lib/teleport/license.pem"` | no |
| <a name="input_public_subnet_id_0"></a> [public\_subnet\_id\_0](#input\_public\_subnet\_id\_0) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region is AWS region, the region should support EFS | `string` | n/a | yes |
| <a name="input_route53_zone"></a> [route53\_zone](#input\_route53\_zone) | DNS and Let's Encrypt integration variables Zone name to host DNS record, e.g. example.com | `string` | n/a | yes |
| <a name="input_use_acm"></a> [use\_acm](#input\_use\_acm) | Whether to use Amazon-issued certificates via ACM or not This must be set to true for any use of ACM whatsoever, regardless of whether Terraform generates/approves the cert | `bool` | `false` | no |
| <a name="input_use_letsencrypt"></a> [use\_letsencrypt](#input\_use\_letsencrypt) | Whether to use Let's Encrypt-issued certificates | `bool` | `true` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->