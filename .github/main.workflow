workflow "SwiftPM-Workflow" {
  on = "push"
  resolves = ["Swift Package Publish"]
}

action "Swift Package Fetch" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
  runs = "swift package resolve"
}

action "Swift Package Build" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
  needs = ["Swift Package Fetch"]
  runs = "swift build --build-tests"
}

action "Swift Package Test" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
  needs = ["Swift Package Build"]
  runs  = "swift test --parallel "
}

action "Swift Package Publish" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
  needs = ["Swift Package Test"]
  runs = "sh git_config.sh"
}
