resource "aws_instance" "bastion01" {
  ami = var.ubuntu2004_id
  instance_type = var.instance_type
  key_name = "${var.key_name}"
  tags = {
    Name = "bastion01-${var.environment}"
    Env = var.environment
    Type = var.instance_type
    App = "bastion"
  }
  vpc_security_group_ids = ["${var.sg_ssh}"]
}