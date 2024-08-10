provider "aws" {
  region = var.aws_region # Set your desired AWS region
}

resource "aws_ecr_repository" "my_ecr_repo" {
  name = var.ecr_name
  image_tag_mutability  = var.image_mutability
  force_delete         = var.force_delete_repo
}

output "tcnapp_repo_url" {
  value = aws_ecr_repository.my_ecr_repo.repository_url
}

