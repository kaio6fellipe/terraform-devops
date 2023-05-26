resource "aws_iam_role" "loki" {
  name               = "LokiStorage-${local.cluster_name}"
  assume_role_policy = data.aws_iam_policy_document.oidc.json

  inline_policy {}
}

resource "aws_iam_policy" "loki" {
  name        = "LokiStorageAccessPolicy-${local.bucket_name}"
  path        = "/"
  description = "Allows Loki to access bucket"

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Effect : "Allow",
        Action : [
          "s3:ListBucket",
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ],
        Resource : [
          aws_s3_bucket.loki-data.arn,
          "${aws_s3_bucket.loki-data.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "loki-attach" {
  role       = aws_iam_role.loki.name
  policy_arn = aws_iam_policy.loki.arn
}