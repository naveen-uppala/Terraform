provider "aws" {
  region = var.aws_region # Set your desired AWS region
}

resource "aws_ecr_repository" "my_ecr_repo" {
  name = var.ecr_name
  image_tag_mutability  = var.image_mutability
  tags             = var.tags
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = false
  }


}

output "demo_app_repo_url" {
  value = aws_ecr_repository.my_ecr_repo.repository_url
}