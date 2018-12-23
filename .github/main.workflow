workflow "SwiftPM-Workflow" {
  on = "push"
  resolves = ["Swift Build"]
}

action "Swift Build" {
  uses = "./action-a"
}
