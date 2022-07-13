resource "aws_instance" "ansible-server01" {
  ami = "ami-0070c5311b7677678"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  tags = {
    Name = "ansible-server01"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_key_pair.terraform-aws]
}

resource "aws_instance" "ansible-server02" {
  ami = "ami-0070c5311b7677678"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  tags = {
    Name = "ansible-server02"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_key_pair.terraform-aws]
}