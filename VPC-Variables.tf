#VPC name
variable "vpc-terraform" {
  type        = string
  description = "name of vpc provisioned by terraform"
  default     = "vpc-terraform"
}


#VPC CIDR Block
variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "113.0.0.0/16"
}


#Define Variables for availability zones and subnets
/*variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}*/

variable "vpc_private_subnets" {
  description = "CIDR block for VPC private subnets"
  type        = list(string)
  default     = ["113.0.1.0/24", "113.0.2.0/24"]
}

variable "vpc_public_subnets" {
  description = "CIDR block for vpc public subnets"
  type        = list(string)
  default     = ["113.0.3.0/24", "113.0.4.0/24"]
}

#Database subnets and config
variable "database_subnet_group" {
  type    = bool
  default = true
}

#Database route table
variable "database_subnet_route_table" {
  type    = bool
  default = true
}

#Databse subnet
variable "vpc_database_subnet" {
  type        = list(string)
  description = "cidr block for the databse subnets"
  default     = ["113.0.5.0/24", "113.0.6.0/24"]
}

#VPC NAT Gateway config 
variable "vpc_nat_gateway" {
  type    = bool
  default = true
}

variable "single_nat_gateway" {
  type    = bool
  default = true
}

