// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  required_version = "1.2.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.1"
    }
    external = {
      source  = "hashicorp/external"
      version = "2.3.1"
    }
    github = {
      source  = "integrations/github"
      version = "5.42.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.7"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.20.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.0"
    }
  }
}
