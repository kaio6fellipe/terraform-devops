bucket          = "terraform-state20220711040913053000000001"
key             = "state-prod/terraform.tfstate"
region          = "us-east-1"
encrypt         = true
kms_key_id      = "alias/terraform-bucket-key"
dynamodb_table  = "terraform-state-prod"