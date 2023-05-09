/*
Configuration of S3 bucket for certs and replay
storage. Uses server side encryption to secure
session replays and SSL certificates.
*/

// S3 bucket for cluster storage
// For demo purposes, don't need bucket logging
// tfsec:ignore:aws-s3-enable-bucket-logging
resource "aws_s3_bucket" "storage" {
  #checkov:skip=CKV2_AWS_61: For demo purposes, don't need lifecycle configuration
  #checkov:skip=CKV2_AWS_62: For demo purposes, dont't need event notifications enabled
  #checkov:skip=CKV_AWS_144: For demo purposes, don't need cross-region replication enabled
  #checkov:skip=CKV_AWS_145: For demo purposes, don't need default encryption with KMS
  bucket        = local.s3_bucket_name
  force_destroy = true

  logging {
    target_bucket = local.s3_bucket_name
    target_prefix = "bucket-access-log/${local.s3_bucket_name}"
  }
}

resource "aws_s3_bucket_acl" "storage" {
  bucket = aws_s3_bucket.storage.bucket
  acl    = "private"
}

resource "aws_s3_bucket_ownership_controls" "goteleport" {
  bucket = aws_s3_bucket.storage.bucket

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

// For demo purposes, CMK is not needed
// tfsec:ignore:aws-s3-encryption-customer-key
resource "aws_s3_bucket_server_side_encryption_configuration" "storage" {
  bucket = aws_s3_bucket.storage.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "storage" {
  bucket = aws_s3_bucket.storage.bucket

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "storage" {
  bucket = aws_s3_bucket.storage.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
