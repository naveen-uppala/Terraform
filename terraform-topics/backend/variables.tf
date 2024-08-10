variable "aws_region" {
  type = string
  default = "us-east-2"
}

variable "ecr_name" {
  type = string
  default = "demo"
}

variable "image_mutability" {
  type = string
  default = "MUTABLE"
}

variable "force_delete_repo" {
  type = bool
  default = false
}
