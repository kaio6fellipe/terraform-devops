data "aws_ami" "ubuntu2004" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20220719.0-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_availability_zones" "az_zones" {
  all_availability_zones = true
}

data "aws_route53_zone" "private_zone" {
  name         = "${var.environment}.private.ktech-br.com"
  private_zone = true
  depends_on   = [module.zones.route53_zone_zone_id]
}

data "terraform_remote_state" "base_foundation" {
  backend = "s3"
  config = {
    bucket = "terraform-state20220711040913053000000001"
    key    = "state-dev/terraform.tfstate"
    region = "us-east-1"
  }
}
