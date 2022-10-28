# Availabillity Zone Data source
data "aws_availability_zones" "available" {
  state = "available"
}


#VPC Module definition
module "vpc-terraform" {
  #VPC source and required terraform version 
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.16.1"

  #Name and CIDR bock of the VPC
  name = "${local.name}-${var.vpc-terraform}"
  cidr = var.vpc_cidr_block

  #Specify AZ's and cidr blocks for subnets
  azs             = data.aws_availability_zones.available.names
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  #Specify Database setup
  create_database_subnet_group       = var.database_subnet_group
  create_database_subnet_route_table = var.database_subnet_route_table
  database_subnets                   = var.vpc_database_subnet

  #NAT Gateway Setup
  enable_nat_gateway = var.vpc_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  #DNS - VPC
  enable_dns_hostnames = true
  enable_dns_support   = true

  #Tags - Subnets, VPC & General tags
  private_subnet_tags = {
    Type                                              = "Private Subnets"
    "kubernetes.io/role/internal-elb"                 = 1
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }

  public_subnet_tags = {
    Type                                              = "Public Subnets"
    "kubernetes.io/role/elb"                          = 1
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }

  database_subnet_tags = {
    Type = "Database subnets"
  }

  tags = {
    Owner       = "Ade-general"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-dev"
  }

}
