resource "aws_s3_bucket" "mimir_bucket" {
  bucket        = "mimir-bucket-ktech-br-${var.environment}"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "mimir_bucket" {
  bucket = aws_s3_bucket.mimir_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "mimir_bucket"{
  bucket = aws_s3_bucket.mimir_bucket.id

  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
    bucket = aws_s3_bucket.mimir_bucket.id

    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}