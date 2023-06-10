<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.2.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.57.1 |
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | 1.40.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_grafana.cloud"></a> [grafana.cloud](#provider\_grafana.cloud) | 1.40.1 |
| <a name="provider_grafana.ktechdevops"></a> [grafana.ktechdevops](#provider\_grafana.ktechdevops) | 1.40.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [grafana_cloud_stack.ktechdevops](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/cloud_stack) | resource |
| [grafana_cloud_stack_api_key.management](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/cloud_stack_api_key) | resource |
| [grafana_dashboard.argocd-overview](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_dashboard.integration---cloudwatch-metrics](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_dashboard.integration---github](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_dashboard.loki-dashboard](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_dashboard.node-exporter-full](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_dashboard.red](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_data_source.github](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/data_source) | resource |
| [grafana_data_source.testdata](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/data_source) | resource |
| [grafana_folder.argocd](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/folder) | resource |
| [grafana_folder.integration-cloudwatch-metrics](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/folder) | resource |
| [grafana_folder.integration-github](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/folder) | resource |
| [grafana_folder.integration-linux-node](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/folder) | resource |
| [grafana_folder.loki](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/folder) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_GITHUB_PAT"></a> [GITHUB\_PAT](#input\_GITHUB\_PAT) | GitHub Personal Access Token used on GitHub Data Source | `string` | `"ghp_1nV4L1D_p3rS0n4L_4Cc3sS_T0k3n"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->