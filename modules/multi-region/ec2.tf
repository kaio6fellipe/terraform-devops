resource "aws_instance" "ansible-server01" {
  ami = data.aws_ami.ubuntu2004.id
  instance_type = var.ansible_instance_type
  key_name = "${var.key_name}-${var.environment}"
  tags = {
    Name = "ansible-server01-${var.environment}"
    Env = var.environment
    Type = var.ansible_instance_type
  }
  # vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_key_pair.terraform-aws]
}

resource "aws_instance" "bastion01" {
  ami = data.aws_ami.ubuntu2004.id
  instance_type = var.instance_type
  key_name = "${var.key_name}-${var.environment}"
  tags = {
    Name = "bastion01-${var.environment}"
    Env = var.environment
    Type = var.instance_type
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_key_pair.terraform-aws]
}