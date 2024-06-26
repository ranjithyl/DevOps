resource "aws_codedeploy_app" "app" {
  name = var.application_name
}

resource "aws_codedeploy_deployment_group" "deployment_group" {
  app_name              = aws_codedeploy_app.app.name
  deployment_group_name = var.deployment_group_name
  service_role_arn      = var.service_role_arn

  deployment_style {
    deployment_type = "BLUE_GREEN"
    deployment_option = "WITH_TRAFFIC_CONTROL"
  }

  ec2_tag_filter {
    key   = var.ec2_tag_key
    value = var.ec2_tag_value
    type  = "KEY_AND_VALUE"
  }

  load_balancer_info {
    elb_info {
      name = "my-load-balancer"
    }
  }
}

output "application_name" {
  value = aws_codedeploy_app.app.name
}

output "deployment_group_name" {
  value = aws_codedeploy_deployment_group.deployment_group.deployment_group_name
}
