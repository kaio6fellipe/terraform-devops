# terraform {
#   backend "s3" {
#     bucket = "terraform-state"
#     key = "terraform/terraform.tfstate"
#     region = "us-east-1"
#     encrypt = true
# 
#   }
# }