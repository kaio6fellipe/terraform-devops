locals {
  wildcard_certificate = sensitive(data.aws_acm_certificate.wildcard_certificate.arn)
}