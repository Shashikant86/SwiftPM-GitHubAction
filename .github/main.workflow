workflow "SwiftPM-Workflow" {
  on = "push"
  resolves = ["SwiftPM-GitHubAction"]
}

action "Swift Build" {
  uses = "./action-a"
}
