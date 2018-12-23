workflow "SwiftPM-Workflow" {
  on = "push"
  resolves = ["Swift Package Publish"]
}

action "Swift Package Clean" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
  runs = "swift package clean && swift package resolve"
}

action "Swift Package Build" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
  needs = ["Swift Package Clean"]
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
  env = {
    TAG = "0.0.1"
  }
  runs = "git tag 0.0.1 && git push origin 0.0.1"
}
