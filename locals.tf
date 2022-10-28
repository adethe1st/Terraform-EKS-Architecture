#Local Variables
# Define Local Values in Terraform
locals {
  owners           = var.business_divsion
  environment      = var.environment
  name             = "${var.business_divsion}-${var.environment}"
  eks_cluster_name = "${local.name}-${var.cluster_name}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
}
