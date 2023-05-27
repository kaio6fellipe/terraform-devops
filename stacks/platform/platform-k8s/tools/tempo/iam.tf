resource "aws_iam_role" "tempo" {
  name               = "TempoStorage-${local.cluster_name}"
  assume_role_policy = data.aws_iam_policy_document.oidc.json

  inline_policy {}
}

resource "aws_iam_policy" "tempo" {
  name        = "TempoStorageAccessPolicy-all-tempo-buckets-${local.globals.environment}"
  path        = "/"
  description = "Allows Tempo to access Tempo owned bucket"

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Effect : "Allow",
        Action : [
          "s3:ListBucket",
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:GetObjectTagging",
          "s3:PutObjectTagging"
        ],
        Resource : [
          aws_s3_bucket.tempo-traces.arn,
          "${aws_s3_bucket.tempo-traces.arn}/*",
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "tempo-attach" {
  role       = aws_iam_role.tempo.name
  policy_arn = aws_iam_policy.tempo.arn
}