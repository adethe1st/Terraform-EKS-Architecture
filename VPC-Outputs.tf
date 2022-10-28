#Ouput VPC ID
output "vpc_id" {
  description = "The id of the vpc-terraform"
  value       = module.vpc-terraform.vpc_id
}

#VPC CIDR Blocks
output "vpc_cidr_block" {
  description = "CIDR range for the VPC"
  value       = module.vpc-terraform.vpc_cidr_block
}

# VPC Private Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc-terraform.private_subnets
}

# VPC Public Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc-terraform.public_subnets
}

# VPC NAT gateway Public IP
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc-terraform.nat_public_ips
}

# VPC AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.vpc-terraform.azs
}