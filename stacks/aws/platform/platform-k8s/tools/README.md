<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.2.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.57.1 |
| <a name="requirement_external"></a> [external](#requirement\_external) | 2.3.1 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.7 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.20.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_external"></a> [external](#provider\_external) | 2.3.1 |
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.7 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert_manager_irsa"></a> [cert\_manager\_irsa](#module\_cert\_manager\_irsa) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | 5.17.0 |
| <a name="module_cluster_autoscaler_irsa"></a> [cluster\_autoscaler\_irsa](#module\_cluster\_autoscaler\_irsa) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | ~> 5.0 |
| <a name="module_crossplane_iam_policy"></a> [crossplane\_iam\_policy](#module\_crossplane\_iam\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | 5.17.0 |
| <a name="module_crossplane_irsa"></a> [crossplane\_irsa](#module\_crossplane\_irsa) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | 5.17.0 |
| <a name="module_external_dns_irsa"></a> [external\_dns\_irsa](#module\_external\_dns\_irsa) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | 5.17.0 |
| <a name="module_external_secrets_irsa"></a> [external\_secrets\_irsa](#module\_external\_secrets\_irsa) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | 5.17.0 |
| <a name="module_load_balancer_controller_irsa"></a> [load\_balancer\_controller\_irsa](#module\_load\_balancer\_controller\_irsa) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | 5.17.0 |
| <a name="module_node_termination_handler_irsa"></a> [node\_termination\_handler\_irsa](#module\_node\_termination\_handler\_irsa) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | 5.17.0 |

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.argocd_apps](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.aws_load_balancer_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.crossplane](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.external_dns](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.external_secrets](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.node_termination_handler](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [external_external.aws_eks_cluster_ca_certificate](https://registry.terraform.io/providers/hashicorp/external/2.3.1/docs/data-sources/external) | data source |
| [external_external.aws_eks_cluster_endpoint](https://registry.terraform.io/providers/hashicorp/external/2.3.1/docs/data-sources/external) | data source |
| [external_external.aws_eks_cluster_token](https://registry.terraform.io/providers/hashicorp/external/2.3.1/docs/data-sources/external) | data source |
| [github_repository_file.argocd](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/repository_file) | data source |
| [github_repository_file.argocd_apps](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/repository_file) | data source |
| [terraform_remote_state.PzaQTyLp7RV3UkOuNO7yJ33MXBmqEaMy7maC-platform-k8s](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN-aws](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->