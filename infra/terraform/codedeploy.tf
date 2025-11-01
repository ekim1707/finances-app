# -------------------- codedeploy.tf --------------------
resource "aws_codedeploy_app" "app" {
  name = "docker-app"
  compute_platform = "Server"
}

resource "aws_codedeploy_deployment_group" "app_group" {
  app_name              = aws_codedeploy_app.app.name
  deployment_group_name = "docker-app-group"
  service_role_arn      = aws_iam_role.codedeploy_role.arn
  deployment_style {
    deployment_type = "IN_PLACE"
    deployment_option = "WITHOUT_TRAFFIC_CONTROL"
  }
  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "docker-app-instance"
    }
  }
  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }
}
