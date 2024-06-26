resource "aws_codecommit_repository" "repo" {
  repository_name = var.repository_name
  description     = "My CodeCommit Repository"
}

output "repository_name" {
  value = aws_codecommit_repository.repo.repository_name
}
