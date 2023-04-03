# module "ebs_kms_key" {
#   source  = "terraform-aws-modules/kms/aws"
#   version = "~> 1.5"
# 
#   description = "Customer managed key to encrypt EKS managed node group volumes"
# 
#   # Policy
#   key_administrators = [
#     local.current_identity
#   ]
# 
#   key_service_roles_for_autoscaling = [
#     # required for the ASG to manage encrypted volumes for nodes
#     "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling",
#     # required for the cluster / persistentvolume-controller to create encrypted PVCs
#     module.eks.cluster_iam_role_arn,
#   ]
# 
#   # Aliases
#   aliases = ["eks/${local.name}/ebs"]
# 
#   tags = local.tags
# }

resource "aws_kms_key" "eks_k8s_platform" {
  description         = "Customer managed key to encrypt EKS managed node group volumes"
  tags                = local.tags
  policy              = data.aws_iam_policy_document.eks.json
  enable_key_rotation = true
}

resource "aws_kms_alias" "eks_k8s_platform" {
  name          = "alias/eks/${local.name}/ebs"
  target_key_id = aws_kms_key.eks_k8s_platform.key_id
}

data "aws_iam_policy_document" "eks" {
  #checkov:skip=CKV_AWS_109: For demo purposes, don't need to specify constraint of resources
  #checkov:skip=CKV_AWS_111: For demo purposes, don't need to specify constraint of resources
  statement {
    sid    = "KeyAdministration"
    effect = "Allow"
    actions = [
      "kms:Create*",
      "kms:Describe*",
      "kms:Enable*",
      "kms:List*",
      "kms:Put*",
      "kms:Update*",
      "kms:Revoke*",
      "kms:Disable*",
      "kms:Get*",
      "kms:Delete*",
      "kms:TagResource",
      "kms:UntagResource",
      "kms:ScheduleKeyDeletion",
      "kms:CancelKeyDeletion",
    ]
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.arn]
    }
  }

  statement {
    sid    = "KeyServiceRolesASG"
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
    ]
    resources = ["*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling",
        module.eks.cluster_iam_role_arn,
      ]
    }
  }

  statement {
    sid    = "KeyServiceRolesASGPersistentVol"
    effect = "Allow"
    actions = [
      "kms:CreateGrant"
    ]
    resources = ["*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling",
        module.eks.cluster_iam_role_arn,
      ]
    }

    condition {
      test     = "Bool"
      variable = "kms:GrantIsForAWSResource"
      values   = [true]
    }
  }
}
