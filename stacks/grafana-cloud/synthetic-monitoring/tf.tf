# {
#   "terraform": {
#     "required_providers": {
#       "grafana": {
#         "source": "grafana/grafana"
#       }
#     }
#   },
#   "provider": {
#     "grafana": {
#       "url": "https://ktechdevops.grafana.net/",
#       "auth": "<add an api key from grafana.com>",
#       "sm_url": "https://synthetic-monitoring-api-us-east-0.grafana.net",
#       "sm_access_token": "<add an sm access token>"
#     }
#   },
#   "resource": {
#     "grafana_synthetic_monitoring_check": {
#       "podinfo_ktech-devops_com_br_HTTP__https___podinfo_ktech-devops_com_br_": {
#         "job": "podinfo.ktech-devops.com.br(HTTP)",
#         "target": "https://podinfo.ktech-devops.com.br/",
#         "enabled": true,
#         "probes": [
#           12
#         ],
#         "labels": {},
#         "settings": {
#           "http": {
#             "method": "GET",
#             "fail_if_not_ssl": false,
#             "fail_if_ssl": false,
#             "ip_version": "V4",
#             "no_follow_redirects": false,
#             "tls_config": {}
#           }
#         }
#       },
#       "podinfo_ktech-devops_com_br_DNS__podinfo_ktech-devops_com_br": {
#         "job": "podinfo.ktech-devops.com.br(DNS)",
#         "target": "podinfo.ktech-devops.com.br",
#         "enabled": true,
#         "probes": [
#           12
#         ],
#         "labels": {},
#         "settings": {
#           "dns": {
#             "ip_version": "V4",
#             "server": "dns.google",
#             "port": 53,
#             "record_type": "A",
#             "protocol": "UDP",
#             "valid_r_codes": [
#               "NOERROR"
#             ],
#             "validate_answer_rrs": {},
#             "validate_authority_rrs": {},
#             "validate_additional_rrs": {}
#           }
#         }
#       },
#       "bastion-dev_ktech-devops_com_br_ping__bastion-dev_ktech-devops_com_br": {
#         "job": "bastion-dev.ktech-devops.com.br(ping)",
#         "target": "bastion-dev.ktech-devops.com.br",
#         "enabled": true,
#         "probes": [
#           12
#         ],
#         "labels": {},
#         "settings": {
#           "ping": {
#             "ip_version": "V4",
#             "dont_fragment": false
#           }
#         }
#       },
#       "bastion-dev_ktech-devops_com_br_DNS__bastion-dev_ktech-devops_com_br": {
#         "job": "bastion-dev.ktech-devops.com.br(DNS)",
#         "target": "bastion-dev.ktech-devops.com.br",
#         "enabled": true,
#         "probes": [
#           12
#         ],
#         "labels": {},
#         "settings": {
#           "dns": {
#             "ip_version": "V4",
#             "server": "dns.google",
#             "port": 53,
#             "record_type": "A",
#             "protocol": "UDP",
#             "valid_r_codes": [
#               "NOERROR"
#             ],
#             "validate_answer_rrs": {},
#             "validate_authority_rrs": {},
#             "validate_additional_rrs": {}
#           }
#         }
#       },
#       "bastion-dev_ktech-devops_com_br_SSH__bastion-dev_ktech-devops_com_br_22": {
#         "job": "bastion-dev.ktech-devops.com.br(SSH)",
#         "target": "bastion-dev.ktech-devops.com.br:22",
#         "enabled": true,
#         "probes": [
#           12
#         ],
#         "labels": {},
#         "settings": {
#           "tcp": {
#             "ip_version": "V4",
#             "tls_config": {
#               "insecure_skip_verify": true
#             }
#           }
#         }
#       },
#       "bastion-dev_ktech-devops_com_br_traceroute__bastion-dev_ktech-devops_com_br": {
#         "job": "bastion-dev.ktech-devops.com.br(traceroute)",
#         "target": "bastion-dev.ktech-devops.com.br",
#         "enabled": true,
#         "probes": [
#           12
#         ],
#         "labels": {},
#         "settings": {
#           "traceroute": {
#             "max_hops": 64,
#             "max_unknown_hops": 15,
#             "ptr_lookup": true
#           }
#         }
#       }
#     }
#   }
# }
# 