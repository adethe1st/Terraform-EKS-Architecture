#Bastion Instance type variable
variable "ec2_instance_type" {
  type    = string
  default = "t3.micro"
}

#EC2 Instance Key Pair
variable "instance_key_pair" {
  type        = string
  default     = "eks-terraform-key"
  description = "The access key for the Bastion Host"
}

