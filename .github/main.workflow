workflow "SwiftPM-Workflow" {
  on = "push"
  resolves = ["Swift Publish"]
}

action "Swift Clean" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
  args = "package clean"
}

action "Swift Resolve" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
  args = "package resolve"
}

action "Swift Build" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
  args = "build"
}

action "Swift Test" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
  args = "test"
}

action "Swift Publish" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}
