workflow "SwiftPM-Workflow" {
  on = "push"
  resolves = ["Swift Build"]
}

action "Swift Build" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
}
