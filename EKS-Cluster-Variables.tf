#Define the variables the entire Cluster requires (Cluster = Control plane + Node group)
variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = "eksdemo"
}

variable "public_endpoint" {
  type        = bool
  description = "Whether the Amazon EKS public API server endpoint is enabled"
  default     = true
}

variable "private_endpoint" {
  type        = bool
  description = "Whether the Amazon EKS private API server endpoint is enabled"
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "service_ipv4_cidr" {
  type        = string
  default     = null
  description = "service ipv4 cidr for the kubernetes cluster"
}

variable "eks_cluster_version" {
  type        = string
  description = "Kubernetes minor version to use for the EKS cluster (for example 1.21)"
  default     = null
}
