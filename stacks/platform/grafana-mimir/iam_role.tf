resource "aws_iam_instance_profile" "mimir_ec2_profile" {
  name = "ec2_mimir_profile-${var.environment}"
  role = aws_iam_role.mimir_ec2_role.name
}

resource "aws_iam_role" "mimir_ec2_role" {
  name = "ec2_mimir_role-${var.environment}"

  assume_role_policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Effect : "Allow",
        Principal : {
          Service : "ec2.amazonaws.com"
        },
        Action : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "mimir_ec2_policy" {
  name = "ec2_mimir_policy-${var.environment}"
  role = aws_iam_role.mimir_ec2_role.id

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Effect : "Allow",
        Action : [
          "s3:*"
          # "s3:GetObject",
          # "s3:ListBucket",
          # "s3:PutObject",
          # "s3:DeleteObject"
        ],
        Resource : [
          "${aws_s3_bucket.mimir_bucket.arn}",
          "${aws_s3_bucket.mimir_bucket.arn}/*"
        ]
      },
      {
        Effect : "Allow",
        Action : [
          "kms:GenerateDataKey",
          "kms:Decrypt"
        ],
        Resource : [
          "${aws_kms_key.mimir_bucket_key.arn}"
        ]
      }
    ]
  })
}
