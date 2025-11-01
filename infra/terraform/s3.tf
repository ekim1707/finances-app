# -------------------- s3.tf --------------------
resource "aws_s3_bucket" "artifacts" {
  bucket = "my-app-codedeploy-artifacts-bucket"
  force_destroy = true
}
