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
  needs = "Swift Clean"
  args = "package resolve"
}

action "Swift Build" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
  needs = "Swift Resolve"
  args = "build"
}

action "Swift Test" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
  needs = "Swift Build"
  args = "test"
}

action "Swift Publish" {
  uses = "actions/bin/filter@master"
  needs = "Swift Test"
  env = {
    NEXT_VERSION = "0.0.1"
  }
  args = "tag $NEXT_VERSION "
}
