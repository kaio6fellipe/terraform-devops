terramate {
  required_version = "0.2.18"
  config {
    git {
      default_branch    = "development"
      default_remote    = "origin"
      check_untracked   = true
      check_uncommitted = true
      check_remote      = false # Disabled(false) until I create an script to manage SSH dependencies to authenticate with GitHub
    }
  }
}