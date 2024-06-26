resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = var.bucket_name
}

output "bucket_name" {
  value = aws_s3_bucket.codepipeline_bucket.bucket
}
