variable "region" {
  default = "us-west-2"
}

variable "project_name" {
  default = "my_project"
}

variable "repository_name" {
  default = "my_codecommit_repo"
}

variable "bucket_name" {
  default = "my-codepipeline-artifacts-bucket"
}

variable "codebuild_project_name" {
  default = "my_codebuild_project"
}

variable "application_name" {
  default = "my_code_deploy_application"
}

variable "deployment_group_name" {
  default = "my_code_deploy_deployment_group"
}

variable "ec2_tag_key" {
  default = "Name"
}

variable "ec2_tag_value" {
  default = "CodeDeployDemo"
}
