provider aws {
  region = var.region
}

module s3 {
  source        = .moduless3
  bucket_name   = var.bucket_name
}

module codecommit {
  source           = .modulescodecommit
  repository_name  = var.repository_name
}

module codebuild {
  source               = .modulescodebuild
  project_name         = var.codebuild_project_name
  service_role_arn     = module.iam_roles.codebuild_role_arn
}

module codedeploy {
  source                    = .modulescodedeploy
  application_name          = var.application_name
  deployment_group_name     = var.deployment_group_name
  service_role_arn          = module.iam_roles.codedeploy_role_arn
  ec2_tag_key               = var.ec2_tag_key
  ec2_tag_value             = var.ec2_tag_value
}

module codepipeline {
  source                    = .modulescodepipeline
  project_name              = var.project_name
  role_arn                  = module.iam_roles.codepipeline_role_arn
  artifact_bucket           = module.s3.bucket_name
  repository_name           = module.codecommit.repository_name
  codebuild_project_name    = module.codebuild.project_name
  application_name          = module.codedeploy.application_name
  deployment_group_name     = module.codedeploy.deployment_group_name
}
