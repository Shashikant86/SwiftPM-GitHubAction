workflow "SwiftPM-Workflow" {
  on = "push"
  resolves = ["Hello Github Actions"]
}

action "Swift Build" {
  uses = "./action-a"
}
