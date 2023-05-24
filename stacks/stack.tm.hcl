stack {
  name        = "stacks"
  description = "Stack responsible for the first layer and base network configurations like VPC and Route53"
  id          = "vx28Nz65Ks3lbQuuG6uwKqQdYPO5Y3aq6mbN"
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
