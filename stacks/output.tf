output "availability_zone_0" {
  value = local.availability_zone_0
}

output "private_subnet_id_0" {
  value = local.private_subnet_id_0
}

output "availability_zone_1" {
  value = local.availability_zone_1
}

output "private_subnet_id_1" {
  value = local.private_subnet_id_1
}

output "availability_zone_2" {
  value = local.availability_zone_2
}

output "private_subnet_id_2" {
  value = local.private_subnet_id_2
}

output "private_subnet_cidr_block_0" {
  value = local.private_subnet_cidr_block_0
}

output "public_subnet_id_0" {
  value = local.public_subnet_id_0
}

output "public_subnet_id_1" {
  value = local.public_subnet_id_1
}

output "public_subnet_id_2" {
  value = local.public_subnet_id_2
}

output "database_subnet_id_0" {
  value = local.database_subnet_id_0
}

output "db_subnet_group_name" {
  value = local.db_subnet_group_name
}

output "vpc_id" {
  value = local.vpc_id
}

output "vpc_private_subnets" {
  value = local.vpc_private_subnets
}

output "vpc_public_subnets" {
  value = local.vpc_public_subnets
}

output "vpc_intra_subnets" {
  value = local.vpc_intra_subnets
}

output "private_dns_zone_id" {
  value = data.aws_route53_zone.private_zone.zone_id
}

output "ktech_devops_private_zone_id" {
  value = data.aws_route53_zone.ktech_devops_private_zone.zone_id
}

output "private_dns_zone_name" {
  value = sort(keys(module.zones.route53_zone_zone_id))[0]
}

output "private_dns_zone_arn" {
  value = sort(keys(module.zones.route53_zone_zone_arn))[0]
}
