locals {
    availability_zone_0 = element(module.vpc.azs, 0)
    private_subnet_id_0 = element(module.vpc.private_subnets, 0)
}