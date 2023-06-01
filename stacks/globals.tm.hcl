globals {
  terraform_version = ["1.2.4"]
  grafana_provider  = false
  required_providers = {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.1"
    }
  }
  remote_state_bucket       = "terraform-state20220711040913053000000001"
  remote_state_dynamodb     = "terraform-state"
  remote_state_data_enabled = false
  environment               = "dev"
  region                    = "us-east-1"
}

import {
  source = "/modules/terramate/remote-state.tm.hcl"
}

import {
  source = "/modules/terramate/providers.tm.hcl"
}

import {
  source = "/modules/terramate/versions.tm.hcl"
}

import {
  source = "/modules/terramate/globals.tm.hcl"
}

import {
  source = "/modules/terramate/remote-data.tm.hcl"
}