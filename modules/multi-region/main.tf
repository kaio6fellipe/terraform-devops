module "ansible-server" {
    source = "./ansible-server"
    instance_type = "${var.instance_type}"
    ansible_instance_type = "${var.ansible_instance_type}"
    environment = "${var.environment}"
    ubuntu2004_id = "${data.aws_ami.ubuntu2004.id}"
    key_name = "${var.key_name}-${var.environment}"
    sg_ssh = "${aws_security_group.acesso-ssh.id}"
}

module "bastion" {
    source = "./bastion"
    instance_type = "${var.instance_type}"
    ansible_instance_type = "${var.ansible_instance_type}"
    environment = "${var.environment}"
    ubuntu2004_id = "${data.aws_ami.ubuntu2004.id}"
    key_name = "${var.key_name}-${var.environment}"
    sg_ssh = "${aws_security_group.acesso-ssh.id}"
}