generate_file "/infracost.yml" {
  context = root
  lets {
    infracost = {
      version = "0.1"
      projects = [for stack in terramate.stacks.list : {
        path = tm_substr(stack, 1, 999)
      }]
    }
  }
  content = tm_replace(tm_yamlencode(let.infracost), "\"", "")
}