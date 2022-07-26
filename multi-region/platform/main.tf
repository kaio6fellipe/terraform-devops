module "ansible_server" {
    source = "./ansible-server"
    instance_type = "${var.instance_type}"
    ansible_instance_type = "${var.ansible_instance_type}"
    environment = "${var.environment}"
    ubuntu2004_id = "${var.ubuntu2004_id}"
    key_name = "${var.key_name}-${var.environment}"
    sg_ssh = "${var.sg_ssh}"
}

module "bastion" {
    source = "./bastion"
    instance_type = "${var.instance_type}"
    ansible_instance_type = "${var.ansible_instance_type}"
    environment = "${var.environment}"
    ubuntu2004_id = "${var.ubuntu2004_id}"
    key_name = "${var.key_name}-${var.environment}"
    sg_ssh = "${var.sg_ssh}"
}