module "ansible_server" {
    source = "./ansible-server"
    instance_type = "${var.instance_type}"
    ansible_instance_type = "${var.ansible_instance_type}"
    environment = "${var.environment}"
    ubuntu2004_id = "${var.ubuntu2004_id}"
    key_name = "${var.key_name}"
    sg_ssh = "${var.sg_ssh}"
    availability_zone_0 = "${var.availability_zone_0}"
    subnet_id_0 = "${var.subnet_id_0}"
}

module "bastion" {
    source = "./bastion"
    instance_type = "${var.instance_type}"
    ansible_instance_type = "${var.ansible_instance_type}"
    environment = "${var.environment}"
    ubuntu2004_id = "${var.ubuntu2004_id}"
    key_name = "${var.key_name}"
    sg_ssh = "${var.sg_ssh}"
}