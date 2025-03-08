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
  default     = "frontend-alb"
}


variable "subnets" {
  description = "The subnet ID(s) for the ALB"
  type        = list(string)
  default     = ["subnet-02b7cd509493d4509", "subnet-01a4eb19143e0a787", "subnet-0222086e138ca3852"]
}

variable "enable_deletion_protection" {
  description = "Set to true if you want deletion protection"
  default     = false
}

variable "listener_port" {
  description = "The port for the ALB listener"
  default     = 443
}

variable "listener_protocol" {
  description = "The protocol for the ALB listener"
  default     = "HTTPS"
}


variable "vpc_id" {
  description = "The VPC ID"
  default     = "vpc-08f32cb147bf6df43"
}

variable "listener_rule_path_pattern" {
  description = "The path pattern for the listener rule"
  default     = ["/"]
}



# variable "health_check_path" {
#   description = "The health check path"
#   default     = "/"
# }


# variable "target_group_name" {
#   description = "The name of the target group"
#   default     = "my-target-group"
# }

# variable "target_group_port" {
#   description = "The port for the target group"
#   default     = 80
# }

# variable "target_group_protocol" {
#   description = "The protocol for the target group"
#   default     = "HTTP"
# }