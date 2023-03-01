module "irsa-ebs-csi" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "5.12.0"

  create_role                   = true
  role_name                     = "AmazonEKSTFEBSCSIRole-${module.platform_eks.cluster_name}"
  provider_url                  = module.platform_eks.oidc_provider
  role_policy_arns              = [data.aws_iam_policy.ebs_csi_policy.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:ebs-csi-controller-sa"]
}