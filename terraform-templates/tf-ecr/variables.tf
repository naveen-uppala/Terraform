variable "aws_region" {
  description = "Aws Region"
  type        = string
}

variable "ecr_frontend" {
  description = "ECR repository for storing frontend docker images"
  type        = string
}

variable "ecr_backend" {
  description = "ECR repository for storing backend docker images"
  type        = string
}

variable "tags" {
  description = "The key-value maps for tagging"
  type        = map(string)

}


variable "encrypt_type" {
  description = "Provide type of encryption here"
  type        = string
  default     = "KMS"
}

variable "image_mutability" {
  description = "The list of ecr names to create"
  type        = string
}