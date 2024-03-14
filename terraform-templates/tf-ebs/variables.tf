variable "aws_region" {
  description = "The AWS region where the resources will be provisioned."
   type        = string
}

variable "aws_profile" {
  description = "The AWS profile to be used for authentication."
  type        = string
}

variable "ebs_availability_zone" {
  description = "The availability zone for the EBS volume."
  type        = string
}

variable "ebs_size" {
  description = "The size of the EBS volume in gigabytes."
  type        = number
}

variable "ebs_type" {
  description = "The type of the EBS volume."
  type        = string
}

variable "ebs_encrypted" {
  description = "Specifies whether the EBS volume should be encrypted."
  type        = string
}

variable "ebs_name" {
  description = "The name tag for the EBS volume."
  type        = string
}

variable "ebs_environment" {
  description = "The environment tag for the EBS volume."
  type        = string
}
variable "instance_id" {
  description = "The instance id to attach to the EBS volume."
  type        = string
}

variable "device_name" {
  description = "The device name to attach to instance."
  type        = string
}


