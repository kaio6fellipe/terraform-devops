locals {
  availability_zone_0         = element(module.vpc.azs, 0)
  private_subnet_id_0         = element(module.vpc.private_subnets, 0)
  availability_zone_1         = element(module.vpc.azs, 1)
  private_subnet_id_1         = element(module.vpc.private_subnets, 1)
  availability_zone_2         = element(module.vpc.azs, 2)
  private_subnet_id_2         = element(module.vpc.private_subnets, 2)
  private_subnet_cidr_block_0 = element(module.vpc.private_subnets_cidr_blocks, 0)
  public_subnet_id_0          = element(module.vpc.public_subnets, 0)
  public_subnet_id_1          = element(module.vpc.public_subnets, 1)
  public_subnet_id_2          = element(module.vpc.public_subnets, 2)
  database_subnet_id_0        = element(module.vpc.database_subnets, 0)
  db_subnet_group_name        = module.vpc.database_subnet_group_name
  vpc_id                      = module.vpc.vpc_id
}
