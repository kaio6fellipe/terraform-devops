resource "aws_s3_bucket" "mimir_bucket" {
  #checkov:skip=CKV_AWS_21:This bucket dont need versioning cause its used to store metrics
  #checkov:skip=CKV2_AWS_62: For demo purposes, dont't need event notifications enabled
  #checkov:skip=CKV2_AWS_61: For demo purposes, don't need lifecycle configuration
  #checkov:skip=CKV_AWS_144: For demo purposes, don't need cross-region replication enabled
  #checkov:skip=CKV_AWS_145: For demo purposes, don't need default encryption with KMS
  bucket        = "mimir-bucket-ktech-br-${var.environment}"
  force_destroy = true

  logging {
    target_bucket = "mimir-bucket-ktech-br-${var.environment}"
    target_prefix = "bucket-access-log/mimir-bucket-ktech-br-${var.environment}"
  }
}

// For demo purposes, CMK is not needed
// tfsec:ignore:aws-s3-encryption-customer-key
resource "aws_s3_bucket_server_side_encryption_configuration" "mimir_bucket" {
  bucket = aws_s3_bucket.mimir_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_acl" "mimir_bucket" {
  bucket = aws_s3_bucket.mimir_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_ownership_controls" "mimir_bucket" {
  bucket = aws_s3_bucket.mimir_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_versioning" "mimir_bucket" {
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
