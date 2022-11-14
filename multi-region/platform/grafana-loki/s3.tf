resource "aws_s3_bucket" "loki_bucket" {
  #checkov:skip=CKV_AWS_21:This bucket dont need versioning cause its used to store logs
  #checkov:skip=CKV_AWS_144: For demo purposes, don't need cross-region replication enabled
  bucket        = "loki-bucket-ktech-br-${var.environment}"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "loki_bucket" {
  bucket = aws_s3_bucket.loki_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "loki_bucket"{
  bucket = aws_s3_bucket.loki_bucket.id

  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
    bucket = aws_s3_bucket.loki_bucket.id

    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}