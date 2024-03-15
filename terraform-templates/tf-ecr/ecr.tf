provider "aws" {
  region = var.aws_region # Set your desired AWS region
}

resource "aws_ecr_repository" "my_ecr_repo" {
  name = var.ecr_name
  image_tag_mutability  = var.image_mutability
  tags             = var.tags

  image_scanning_configuration {
    scan_on_push = false
  }


}