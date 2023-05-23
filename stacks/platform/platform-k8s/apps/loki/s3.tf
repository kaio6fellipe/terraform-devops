resource "aws_s3_bucket" "loki-data" {
  bucket = local.bucket_name
}

resource "aws_s3_bucket_policy" "grant-access" {
  bucket = aws_s3_bucket.loki-data.id
  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Sid : "Statement1",
        Effect : "Allow",
        Principal : {
          AWS : aws_iam_role.loki.arn
        },
        Action : [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ],
        Resource : [
          aws_s3_bucket.loki-data.arn,
          "${aws_s3_bucket.loki-data.arn}/*"
        ]
      }
    ]
  })
}