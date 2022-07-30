module "apps" {
    source = "./apps"
    instance_type = "${var.instance_type}"
    environment = "${var.environment}"
}

module "platform" {
    source = "./platform"
    instance_type = "${var.instance_type}"
    ansible_instance_type = "${var.ansible_instance_type}"
    environment = "${var.environment}"
    ubuntu2004_id = "${data.aws_ami.ubuntu2004.id}"
    key_name = "${var.key_name}-${var.environment}"
    sg_ssh = "${aws_security_group.acesso-ssh.id}"
    availability_zone_0 = "${local.availability_zone_0}"
    subnet_id_0 = "${local.subnet_id_0}"
}