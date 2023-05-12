generate_hcl "_terramate_remote-data.tf" {
  condition = global.remote_state_data_enabled == true
  content {
    tm_dynamic "data" {
      for_each  = global.remote_state_datasources
      condition = tm_can(global.remote_state_datasources)
      iterator  = datasource
      labels    = ["terraform_remote_state", tm_replace(datasource.value, "/", "_")]

      attributes = {
        backend = "s3"
        config = {
          bucket         = "${global.remote_state_bucket}"
          key            = "${datasource.value}/terraform.tfstate"
          region         = "${global.region}"
          encrypt        = true
          dynamodb_table = "${global.remote_state_dynamodb}"
        }
      }
    }

    tm_dynamic "locals" {
      for_each  = global.remote_state_datasources
      condition = tm_can(global.remote_state_datasources)
      iterator  = datasource

      attributes = {
        "${tm_replace(datasource.value, "/", "_")}_outputs" = tm_hcl_expression("data.terraform_remote_state.${tm_replace(datasource.value, "/", "_")}.outputs")
      }
    }
  }
}