environment               = "prod"
ansible_instance_type     = "t2.large"
instance_type             = "t2.large"
db_instance_type          = "db.t2.micro"
vpc_cidr                  = "10.99.0.0/16"
private_subnet_a          = "10.99.1.0/24"
public_subnet_a           = "10.99.101.0/24"
private_subnet_b          = "10.99.2.0/24"
public_subnet_b           = "10.99.102.0/24"
private_subnet_c          = "10.99.3.0/24"
public_subnet_c           = "10.99.103.0/24" 
database_subnet_a         = "10.99.201.0/24"
database_subnet_b         = "10.99.202.0/24"
database_subnet_c         = "10.99.203.0/24"
rds_allocated_storage     = 10
rds_max_allocated_storage = 20