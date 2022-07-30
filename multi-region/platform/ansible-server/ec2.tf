module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.1"

  name = "ansible-server01-${var.environment}"

  ami = var.ubuntu2004_id
  instance_type = var.ansible_instance_type
  key_name = "${var.key_name}"
  monitoring = false
  
  availability_zone = var.availability_zone_0
  subnet_id = var.private_subnet_id_0

  tags = {
    Env = var.environment
    Type = var.ansible_instance_type
    App = "ansible"
  }
}