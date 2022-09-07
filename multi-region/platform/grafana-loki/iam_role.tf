resource "aws_iam_instance_profile" "loki_ec2_profile" {
  name = "ec2_loki_profile-${var.environment}"
  role = aws_iam_role.loki_ec2_role.name
}

resource "aws_iam_role" "loki_ec2_role" {
  name = "ec2_loki_role-${var.environment}"

  assume_role_policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
      {
        Effect: "Allow",
        Principal: {
          Service: "ec2.amazonaws.com"
        },
        Action: "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "loki_ec2_policy" {
  name = "ec2_loki_policy-${var.environment}"
  role = aws_iam_role.loki_ec2_role.id

  policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
      {
        Effect:"Allow",
        Action: [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        Resource: [
          "${aws_s3_bucket.loki_bucket.arn}/*"
        ]
      },
      {
        Effect:"Allow",
        Action: [
          "kms:GenerateDataKey",
          "kms:Decrypt"
        ],
        Resource: [
          "${aws_kms_key.loki_bucket_key.arn}"
        ]
      }
    ]
  })
}