output "current_identity_arn" {
  value = data.aws_caller_identity.current.arn
}

output "current_identity_account_id" {
  value = data.aws_caller_identity.current.account_id
}
