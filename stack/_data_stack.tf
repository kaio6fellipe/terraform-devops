data "terraform_remote_state" "base_foundation" {
  backend = "s3"
  config = {
    bucket = "terraform-state20220711040913053000000001"
    key    = "state-dev/terraform.tfstate"
    region = "us-east-1"
  }
}