workflow "SwiftPM-Workflow" {
  on = "push"
}

action "Swift Build" {
  uses = "./action-a"
}
