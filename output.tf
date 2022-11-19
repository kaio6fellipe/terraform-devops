output "instance_type" {             
  value = var.instance_type
}

output "ansible_instance_type" {     
  value = var.ansible_instance_type
}

output "db_instance_type" {          
  value = var.db_instance_type
}

output "rds_allocated_storage" {     
  value = var.rds_allocated_storage
}

output "rds_max_allocated_storage" { 
  value = var.rds_max_allocated_storage
}

output "environment" {               
  value = var.environment
}

output "region" {                    
  value = "us-east-1"
}

output "vpc_cidr" {                  
  value = var.vpc_cidr
}

output "private_subnet_a" {          
  value = var.private_subnet_a
}

output "public_subnet_a" {           
  value = var.public_subnet_a
}

output "private_subnet_b" {          
  value = var.private_subnet_b
}

output "public_subnet_b" {           
  value = var.public_subnet_b
}

output "private_subnet_c" {          
  value = var.private_subnet_c
}

output "public_subnet_c" {           
  value = var.public_subnet_c
}

output "database_subnet_a" {         
  value = var.database_subnet_a
}

output "database_subnet_b" {         
  value = var.database_subnet_b
}

output "database_subnet_c" {         
  value = var.database_subnet_c
}
