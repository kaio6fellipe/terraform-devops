locals {
  availability_zone_0         = element(module.vpc.azs, 0)
  private_subnet_id_0         = element(module.vpc.private_subnets, 0)
  private_subnet_cidr_block_0 = element(module.vpc.private_subnets_cidr_blocks, 0)
  public_subnet_id_0          = element(module.vpc.public_subnets, 0)
  vpc_id                      = module.vpc.vpc_id
}
