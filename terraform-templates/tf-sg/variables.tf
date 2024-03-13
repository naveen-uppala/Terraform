variable "vpc_id" {
  description = "The ID of the VPC where the security groups will be created"
  type        = string
}

variable "aws_region" {
    description = "The AWS region things are created in"
}

variable "ssh_cidr_block" {
  description = "CIDR block for SSH traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# variable "https_cidr_block" {
#   description = "CIDR block for HTTPS traffic"
#   type        = list(string)
#   default     = ["0.0.0.0/0"]
# }
