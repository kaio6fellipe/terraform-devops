stack {
  name        = "grafana-cloud"
  description = "Stack responsible for the first layer of Grafana Cloud components"
  id          = "Ag6VT4tTfBuSba4NUZD6rI799fqqvDbWYL70"

  before = [
    "/stacks/grafana-cloud/synthetic-monitoring"
  ]

  tags = [
    "grafana-cloud"
  ]
}
