resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket        = "codepipeline-ansible-ktech-br-${var.environment}"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "codepipeline_bucket" {
  bucket = aws_s3_bucket.codepipeline_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "codepipeline_bucket"{
  bucket = aws_s3_bucket.codepipeline_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
