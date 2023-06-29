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
| [grafana_dashboard.argocd](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_dashboard.general](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_dashboard.integration---cloudwatch-metrics](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_dashboard.integration---docker](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_dashboard.integration---github](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_dashboard.integration---grafana-agent](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_dashboard.integration---kubernetes](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_dashboard.integration---linux-node](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_dashboard.integration---traefik](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_dashboard.loki](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_dashboard.synthetic-monitoring](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_data_source.github](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/data_source) | resource |
| [grafana_data_source.testdata](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/data_source) | resource |
| [grafana_folder.argocd](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/folder) | resource |
| [grafana_folder.integration-cloudwatch-metrics](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/folder) | resource |
| [grafana_folder.integration-docker](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/folder) | resource |
| [grafana_folder.integration-github](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/folder) | resource |
| [grafana_folder.integration-grafana-agent](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/folder) | resource |
| [grafana_folder.integration-kubernetes](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/folder) | resource |
| [grafana_folder.integration-linux-node](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/folder) | resource |
| [grafana_folder.integration-traefik](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/folder) | resource |
| [grafana_folder.loki](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/folder) | resource |
| [grafana_folder.synthetic-monitoring](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/folder) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_GITHUB_PAT"></a> [GITHUB\_PAT](#input\_GITHUB\_PAT) | GitHub Personal Access Token used on GitHub Data Source | `string` | `"ghp_1nV4L1D_p3rS0n4L_4Cc3sS_T0k3n"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ktech_devops_stack_id"></a> [ktech\_devops\_stack\_id](#output\_ktech\_devops\_stack\_id) | n/a |
| <a name="output_ktech_devops_stack_slug"></a> [ktech\_devops\_stack\_slug](#output\_ktech\_devops\_stack\_slug) | n/a |
| <a name="output_ktechdevops_stack_management_key"></a> [ktechdevops\_stack\_management\_key](#output\_ktechdevops\_stack\_management\_key) | n/a |
| <a name="output_ktechdevops_stack_url"></a> [ktechdevops\_stack\_url](#output\_ktechdevops\_stack\_url) | n/a |
<!-- END_TF_DOCS -->