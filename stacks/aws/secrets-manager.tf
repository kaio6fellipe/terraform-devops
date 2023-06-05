module "stack-secrets-manager" {
  source  = "lgallard/secrets-manager/aws"
  version = "0.8.0"

  secrets = {
    example-string = {
      description             = "My string example secret"
      recovery_window_in_days = 0
      secret_string           = "foo bar"
    },
    example-key-value = {
      description             = "My key value example secret"
      recovery_window_in_days = 0
      secret_key_value = {
        foo = "bar"
        bar = "foo"
      }
    },
    example-binary = {
      description             = "My binary example secret"
      recovery_window_in_days = 0
      secret_binary           = "WoF43+IuQpqc3WyS8BWZ50uawK5lY/aObweX2YiXPv2CoVvHUM0vG7U7BDBvNi2xwsT9n9uT27lcVQsTa8iDtpyoeBhcj3vJ60Jd04UfoMP7Og6UbD+KGiaqQ0LEtMXq6d3i619t7V0UkaJ4MXh2xl5y3bV4zNzTXdSScJnvMFfjLW0pJOOqltLma3NQ9ILVdMSK2Vzxc87T+h/jp0VuUAX4Rx9DqmxEU/4JadXmow/BKy69KVwAk/AQ8jL7OwD2YAxlMKqKnOsBJQF27YjmMD240UjkmnPlxkV8+g9b2hA0iM5GL+5MWg6pPUE0BYdarCmwyuaWYhv/426LnfHTz9UVC3y9Hg5c4X4I6AdJJUmarZXqxnMe9jJiqiQ+CAuxW3m0gIGsEbUul6raG73xFuozlaXq3J+kMCVW24eG2i5fezgmtiysIf/dpcUo+YLkX+U8jdMQg9IwCY0bf8XL39kwJ7u8uWU8+7nMcS9VQ5ll"
    },
    argo-github-sso-secret = {
      description             = "GitHub SSO Secret Key for Argo Application"
      recovery_window_in_days = 0
      secret_string           = var.ARGO_GITHUB_SSO_SECRET_KEY
    },
    crossplane-aws-secret-credentials = {
      description             = "Crossplane credentials"
      recovery_window_in_days = 0
      secret_string           = var.CROSSPLANE_AWS_CREDENTIALS_CONTENT
    },
    grafana-secrets = {
      description             = "Grafana Secrets"
      recovery_window_in_days = 0
      secret_key_value = {
        GF_DATABASE_PASSWORD         = var.AWS_RDS_PASSWORD
        GF_AUTH_GITHUB_CLIENT_ID     = var.GF_AUTH_GITHUB_CLIENT_ID
        GF_AUTH_GITHUB_CLIENT_SECRET = var.GF_AUTH_GITHUB_CLIENT_SECRET
        GF_SECURITY_ADMIN_USER       = var.GF_SECURITY_ADMIN_USER
        GF_SECURITY_ADMIN_PASSWORD   = var.GF_SECURITY_ADMIN_PASSWORD
      }
    },
    grafana-cloud = {
      description             = "Grafana Cloud Integration Secrets"
      recovery_window_in_days = 0
      secret_key_value = {
        GRAFANA_CLOUD_METRICSUSER = var.GRAFANA_CLOUD_METRICSUSER
        GRAFANA_CLOUD_LOGSUSER    = var.GRAFANA_CLOUD_LOGSUSER
        GRAFANA_CLOUD_TRACESUSER  = var.GRAFANA_CLOUD_TRACESUSER
        GRAFANA_CLOUD_TOKEN       = var.GRAFANA_CLOUD_TOKEN
      }
    }
  }
}
