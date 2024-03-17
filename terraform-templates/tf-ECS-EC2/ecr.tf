# --- ECR ---

resource "aws_ecr_repository" "app" {
  name                 = "demo-app"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "demo_app_repo_url" {
  value = aws_ecr_repository.app.repository_url
}