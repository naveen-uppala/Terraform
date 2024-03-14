variable "region" {
  description = "The AWS region"
  default     = "us-east-2"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  default     = "example"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
  default     = []
}

variable "node_instance_type" {
  description = "The EC2 instance type for the EKS nodes"
  default     = "t3.medium"
}

variable "node_desired_size" {
  description = "The desired number of nodes in the EKS node group"
  default     = 2
}

variable "node_max_size" {
  description = "The maximum number of nodes in the EKS node group"
  default     = 4
}

variable "node_min_size" {
  description = "The minimum number of nodes in the EKS node group"
  default     = 1
}

variable "ami_id" {
  description = "The ami_id for the launc h template"
  default     = "ami-0e0bf53f6def86294"
}