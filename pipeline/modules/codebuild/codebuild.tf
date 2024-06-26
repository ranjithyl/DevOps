resource "aws_codebuild_project" "project" {
  name         = var.project_name
  service_role = var.service_role_arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type  = "BUILD_GENERAL1_SMALL"
    image         = "aws/codebuild/standard:4.0"
    type          = "LINUX_CONTAINER"
    privileged_mode = true
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspec.yml"
  }
}

output "project_name" {
  value = aws_codebuild_project.project.name
}
