// Region is AWS region, the region should support EFS
variable "region" {
  type = string
}

// Teleport cluster name to set up
# variable "cluster_name" {
#   type    = string
#   default = "teleport-${var.environment}"
# }

variable "environment" {}

variable "default_sg" {}

variable "public_subnet_id_0" {}

// Path to Teleport Enterprise license file
variable "license_path" {
  type    = string
  default = ""
}

// AMI name to use
variable "ami_name" {
  type    = string
  default = "gravitational-teleport-ami-ent-11.0.1"
}

// DNS and Let's Encrypt integration variables
// Zone name to host DNS record, e.g. example.com
variable "route53_zone" {
  type = string
}

// Domain name to use for Teleport proxy,
// e.g. proxy.example.com
# variable "route53_domain" {
#   type = string
#   default = "teleport-${var.environment}.${var.public_dns_zone_name}"
# }

// Whether to add a wildcard entry *.proxy.example.com for application access
variable "add_wildcard_route53_record" {
  type    = bool
  default = true
}

// whether to enable the mongodb listener
// adds security group setting, maps load balancer to port, and adds to teleport config
variable "enable_mongodb_listener" {
  type    = bool
  default = false
}

// whether to enable the mysql listener
// adds security group setting, maps load balancer to port, and adds to teleport config
variable "enable_mysql_listener" {
  type    = bool
  default = false
}

// whether to enable the postgres listener
// adds security group setting, maps load balancer to port, and adds to teleport config
variable "enable_postgres_listener" {
  type    = bool
  default = false
}

// S3 Bucket to create for encrypted Let's Encrypt certificates
# variable "s3_bucket_name" {
#   type    = string
#   default = "teleport-certificates-ktech-br-${var.environment}"
# }

// Email for Let's Encrypt domain registration
variable "email" {
  type    = string
  default = "kaio6fellipe@gmail.com.br"
}

// SSH key name to provision instances with
variable "key_name" {
  type = string
}

// Whether to use Let's Encrypt-issued certificates
variable "use_letsencrypt" {
  type    = bool
  default = true
}

// Whether to use Amazon-issued certificates via ACM or not
// This must be set to true for any use of ACM whatsoever, regardless of whether Terraform generates/approves the cert
variable "use_acm" {
  type    = bool
  default = false
}

variable "kms_alias_name" {
  type    = string
  default = "alias/aws/ssm"
}

// Instance type for cluster
variable "instance_type" {
  type    = string
  # default = "t3.micro"
}

variable "cdirs_acesso_remoto" {}

variable "vpc_id" {}
