resource "aws_instance" "ansible-server01" {
  ami = data.aws_ami.ubuntu2004.id
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  tags = {
    Name = "ansible-server01"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_key_pair.terraform-aws]
}