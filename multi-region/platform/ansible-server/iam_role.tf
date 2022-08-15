# Code Pipeline

resource "aws_iam_role" "codepipeline_role" {
  name = "codepipeline_ansible_role-${var.environment}"

  assume_role_policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
      {
        Effect: "Allow",
        Principal: {
          Service: "codepipeline.amazonaws.com"
        },
        Action: "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "codepipeline_policy-${var.environment}"
  role = aws_iam_role.codepipeline_role.id

  policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
      {
        Effect:"Allow",
        Action: [
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:PutObjectAcl",
          "s3:PutObject"
        ],
        Resource: [
          "${aws_s3_bucket.codepipeline_bucket.arn}/*"
        ]
      },
      {
        Effect:"Allow",
        Action: [
          "s3:GetBucketVersioning"
        ],
        Resource: [
          "${aws_s3_bucket.codepipeline_bucket.arn}"
        ]
      },
      {
        Effect:"Allow",
        Action: [
          "kms:GenerateDataKey",
          "kms:Decrypt"
        ],
        Resource: [
          "${aws_kms_key.ansible_bucket_key.arn}"
        ]
      },
      {
        Effect: "Allow",
        Action: [
          "codedeploy:CreateDeployment"
        ],
        Resource: [
          "${aws_codedeploy_deployment_group.ansible.arn}"
        ]
      },
      {
        Effect: "Allow",
        Action: [
          "codedeploy:GetDeploymentConfig"
        ],
        Resource: [
          "arn:aws:codedeploy:${var.region}:${data.aws_caller_identity.current.account_id}:deploymentconfig:${aws_codedeploy_deployment_config.ansible.id}"
        ]
      },
      {
        Effect: "Allow",
        Action: [
          "codedeploy:RegisterApplicationRevision",
          "codedeploy:GetApplicationRevision"
        ],
        Resource: [
          "${aws_codedeploy_app.ansible.arn}"
        ]
      }
    ]
  })
}

# Code Deploy

resource "aws_iam_role_policy_attachment" "AWSCodeDeployRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  role       = aws_iam_role.codedeploy_role.name
}

resource "aws_iam_role" "codedeploy_role" {
  name = "ansible_codedeploy_role-${var.environment}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# GitHub Actions

resource "aws_iam_role" "github_role" {
  name = "github_ansible_role-${var.environment}"
  path = "/"

  assume_role_policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
      {
        Effect: "Allow",
        Action: "sts:AssumeRoleWithWebIdentity",
        Principal: {
          Federated: "${aws_iam_openid_connect_provider.github_actions.arn}"
        },
        Condition: {
          StringLike: {
            "token.actions.githubusercontent.com:sub": "repo:${var.ansible_repository}:*"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "github_policy" {
  name = "github_ansible_policy-${var.environment}"
  role = aws_iam_role.github_role.id

  policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
      {
        Effect:"Allow",
        Action: [
          "s3:PutObject"
        ],
        Resource: [
          "${aws_s3_bucket.codepipeline_bucket.arn}/*"
        ]
      }
    ]
  })
}
