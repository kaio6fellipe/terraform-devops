# variable "amis" {
#   default = {
#       "us-east-1" = "ami-0070c5311b7677678"
#       "sa-east-1" = "ami-088afbba294231fe0"
#   }
# }

variable "cdirs_acesso_remoto" {
  default = ["201.33.199.59/32"]
}

variable "key_name" {
  default = "terraform-aws"
}