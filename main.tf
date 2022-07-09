provider "aws" {
  access_key = "AKIAQKYEBHP5EUSFEEPL"
  secret_key = "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"
  region  = "us-east-1"
}

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

resource "aws_key_pair" "terraform-aws" {
  key_name   = "${var.key_name}"
  public_key = file("${abspath(path.cwd)}/terraform-aws.pub")
}