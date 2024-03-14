variable "aws_region" {
  description = "The name of the SSH key pair to use for instances"
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair to use for instances"
  type        = string
}

variable "instance_type" {
  description = "Instance Type of EC2 instance for launch template"
  type        = string
}


variable "subnet_id" {
  description = "The ID of the subnet in which to launch instances"
  type        = string
}

variable "security_groups" {
  description = "List of security group IDs to associate with instances"
  type        = list(string)
}

variable "default_desired_capacity" {
  description = "Default desired capacity for the autoscaling group"
  type        = number
}
variable "min_size" {
  description = "Default desired capacity for the autoscaling group"
  type        = number
}
variable "max_size" {
  description = "Default desired capacity for the autoscaling group"
  type        = number
}

variable "ami_id" {
  description = "The AMI ID"
  type        = string
}

