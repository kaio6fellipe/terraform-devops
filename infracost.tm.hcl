generate_file "/infracost.yml" {
  context = root
  lets {
    infracost = {
      version = "0.1"
      projects = [for stack in terramate.stacks.list : {
        path = stack
      }]
    }
  }
  content = tm_yamlencode(let.infracost)
}