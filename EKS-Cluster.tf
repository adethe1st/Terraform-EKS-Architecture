#This holds the eks resource and its requirements
resource "aws_eks_cluster" "eks_cluster" {
  name     = "${local.name}-${var.cluster_name}"
  role_arn = aws_iam_role.eks_master_role.arn
  version  = var.eks_cluster_version

  vpc_config {
    subnet_ids              = module.vpc-terraform.public_subnets
    endpoint_private_access = var.private_endpoint
    endpoint_public_access  = var.public_endpoint
    public_access_cidrs     = var.cluster_endpoint_public_access_cidrs
  }

  kubernetes_network_config {
    service_ipv4_cidr = var.service_ipv4_cidr
  }

  # Enable EKS Cluster Control Plane Logging
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController,
  ]
}
