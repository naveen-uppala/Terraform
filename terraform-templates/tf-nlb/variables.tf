variable "region" {
  description = "The AWS region where resources will be created."
  default     = "us-east-2"
}

variable "nlb_name" {
  description = "The name of the Network Load Balancer (NLB)."
  default     = "my-nlb"
}

variable "internal_nlb" {
  description = "Set to true if the NLB should be internal, false otherwise."
  default     = false
}

variable "security_groups" {
  description = "List of security group IDs to attach to the NLB."
  type        = list(string)
  default     = ["sg-06ac155edea432fbc"]
}

variable "subnets" {
  description = "List of subnet IDs where the NLB will be deployed."
  type        = list(string)
  default     = ["subnet-061b0dd145e444875", "subnet-0c821a62cb75f25be", "subnet-03113ab7dc2eae892"]
}

variable "enable_deletion_protection" {
  description = "Set to true if you want deletion protection for the NLB."
  default     = false
}

variable "listener_port" {
  description = "The port on which the NLB will listen for incoming traffic."
  default     = 3306
}

variable "target_group_name" {
  description = "The name of the target group for the NLB."
  default     = "my-target-group"
}

variable "target_port" {
  description = "The port on which the target instances will receive traffic."
  default     = 3306
}

variable "vpc_id" {
  description = "The ID of the VPC where the target instances are located."
  default     = "vpc-0b46d8b7746118a42"
}
