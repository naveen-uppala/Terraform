variable "region" {
  description = "The AWS region"
  default     = "us-east-2"
}

variable "internal" {
  description = "Set to true if the ALB should be internal"
  default     = false
}

variable "load_balancer_name" {
  description = "The name of the load balancer"
  default     = "my-alb2"
}

variable "security_groups" {
  description = "The security group ID(s) for the ALB"
  type        = list(string)
  default     = ["sg-06ac155edea432fbc"]
}

variable "subnets" {
  description = "The subnet ID(s) for the ALB"
  type        = list(string)
  default     = ["subnet-061b0dd145e444875", "subnet-0c821a62cb75f25be", "subnet-03113ab7dc2eae892"]
}

variable "enable_deletion_protection" {
  description = "Set to true if you want deletion protection"
  default     = false
}

variable "listener_port" {
  description = "The port for the ALB listener"
  default     = 80
}

variable "listener_protocol" {
  description = "The protocol for the ALB listener"
  default     = "HTTP"
}

variable "target_group_name" {
  description = "The name of the target group"
  default     = "my-target-group"
}

variable "target_group_port" {
  description = "The port for the target group"
  default     = 80
}

variable "target_group_protocol" {
  description = "The protocol for the target group"
  default     = "HTTP"
}

variable "vpc_id" {
  description = "The VPC ID"
  default     = "vpc-0b46d8b7746118a42"
}

variable "health_check_path" {
  description = "The health check path"
  default     = "/"
}

variable "listener_rule_path_pattern" {
  description = "The path pattern for the listener rule"
  default     = ["/"]
}
