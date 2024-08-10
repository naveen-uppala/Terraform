######################### Common variables #######################
variable "region" {
  description = "Region where you want to provision the infra"
  type        = string
}

################### Variables for Security group ###################

variable "sg_name" {
  description = "Security group name"
  type        = string
}

variable "sg_description" {
  description = "variable for security group description"
  type        = string
}

variable "ssh_port" {
  description = "port for ssh access"
  type = number
  default = 22
  
}

################### Variables for EC2 instance ###################
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for creating the Linux X_86 instance"
  type        = string
}

variable "instance_type" {
  description = "instance type for ec2 instance"
  type        = string
}


