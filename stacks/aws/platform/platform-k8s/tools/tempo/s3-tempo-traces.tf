resource "aws_s3_bucket" "tempo-traces" {
  #checkov:skip=CKV_AWS_144: This bucket don't need cross-region replication
  #checkov:skip=CKV_AWS_18: This bucket don't need logging enabled because only tempo application will access it
  #checkov:skip=CKV2_AWS_62: This bucket don't need notifications
  #checkov:skip=CKV2_AWS_61: This bucket don't need lifecycle configuration
  #checkov:skip=CKV_AWS_21: This bucket don't need versioning
  #checkov:skip=CKV_AWS_145: This bucket don't need KMS
  bucket        = local.bucket_names.traces
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "block-traces" {
  bucket = aws_s3_bucket.tempo-traces.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "grant-access-traces" {
  bucket = aws_s3_bucket.tempo-traces.id
  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Sid : "Statement1",
        Effect : "Allow",
        Principal : {
          AWS : aws_iam_role.tempo.arn
        },
        Action : [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:ListBucket",
          "s3:GetObjectTagging",
          "s3:PutObjectTagging"
        ],
        Resource : [
          aws_s3_bucket.tempo-traces.arn,
          "${aws_s3_bucket.tempo-traces.arn}/*"
        ]
      }
    ]
  })
}