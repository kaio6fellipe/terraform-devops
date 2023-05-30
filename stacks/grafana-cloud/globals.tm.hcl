globals {
  grafana_provider = true
  required_providers = {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.1"
    }
    grafana = {
      source  = "grafana/grafana"
      version = "1.40.1"
    }
  }
}