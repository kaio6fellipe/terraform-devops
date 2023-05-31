resource "aws_iam_role" "mimir" {
  name               = "MimirStorage-${local.cluster_name}"
  assume_role_policy = data.aws_iam_policy_document.oidc.json

  inline_policy {}
}

resource "aws_iam_policy" "mimir" {
  name        = "MimirStorageAccessPolicy-all-mimir-buckets-${local.globals.environment}"
  path        = "/"
  description = "Allows Mimir to access Mimir owned bucket"

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
          aws_s3_bucket.mimir-alertmanager.arn,
          "${aws_s3_bucket.mimir-alertmanager.arn}/*",
          aws_s3_bucket.mimir-blocks.arn,
          "${aws_s3_bucket.mimir-blocks.arn}/*",
          aws_s3_bucket.mimir-ruler.arn,
          "${aws_s3_bucket.mimir-ruler.arn}/*",
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "mimir-attach" {
  role       = aws_iam_role.mimir.name
  policy_arn = aws_iam_policy.mimir.arn
}