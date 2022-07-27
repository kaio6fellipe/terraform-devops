module "us-east-1" {
  source = "./multi-region/"
  instance_type = "${var.instance_type}"
  ansible_instance_type = "${var.ansible_instance_type}"
  environment = "${var.environment}"
  providers = {
    aws = aws.use1
  }
}

# module "sa-east-1" {
#   source = "./modules/multi-region"
#   instance_type = "${var.instance_type}"
#   ansible_instance_type = "${var.ansible_instance_type}"
#   environment = "${var.environment}"
#   providers = {
#     aws = aws.sae1
#   }
# }

module "apps" {
  source = "./apps/"
  environment = "${var.environment}"
  instance_type = "${var.instance_type}"
}

module "platform" {
  source = "./platform/"
  environment = "${var.environment}"
  instance_type = "${var.instance_type}"
}