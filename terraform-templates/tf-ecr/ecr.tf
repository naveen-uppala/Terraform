provider "aws" {
  region = var.aws_region # Set your desired AWS region
}

resource "aws_ecr_repository" "my_frontend_repo" {
  name = var.ecr_frontend
  image_tag_mutability  = var.image_mutability
  tags             = var.tags
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = false
  }

}

resource "aws_ecr_repository" "my_backend_repo" {
  name = var.ecr_backend
  image_tag_mutability  = var.image_mutability
  tags             = var.tags
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = false
  }

}

