#Variables all resources generally have in common
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

#Environment Variable
variable "environment" {
  type        = string
  description = "Environment variable used a prefix"
  default     = "dev"
}

#Business Division
variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type        = string
  default     = "SAP"
}