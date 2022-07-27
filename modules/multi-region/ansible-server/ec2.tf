resource "aws_instance" "ansible-server01" {
  ami = var.ubuntu2004_id
  instance_type = var.ansible_instance_type
  key_name = "${var.key_name}"
  tags = {
    Name = "ansible-server01-${var.environment}"
    Env = var.environment
    Type = var.ansible_instance_type
  }
}