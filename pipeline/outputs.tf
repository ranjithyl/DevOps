output "bucket_name" {
  value = module.s3.bucket_name
}

output "repository_name" {
  value = module.codecommit.repository_name
}

output "codebuild_project_name" {
  value = module.codebuild.project_name
}

output "application_name" {
  value = module.codedeploy.application_name
}

output "deployment_group_name" {
  value = module.codedeploy.deployment_group_name
}

output "pipeline_name" {
  value = module.codepipeline.pipeline_name
}
