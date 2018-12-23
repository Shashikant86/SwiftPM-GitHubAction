workflow "SwiftPM-Workflow" {
  on = "push"
  resolves = ["Swift Publish"]
}

action "Swift Clean" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
  runs = "swift package clean"

}
action "Swift Resolve" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
  needs = ["Swift Clean"]
  runs = "swift package clean""
}

action "Swift Build" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
  needs = ["Swift Resolve"]
  runs = "swift build --build-tests"
}

action "Swift Test" {
  uses = "Shashikant86/SwiftPM-GitHubAction@master"
  needs = ["Swift Build"]
  runs  = "swift test --parallel "
}

action "Swift Package Tag" {
  uses = "actions/bin/filter@master"
  needs = ["Swift Test"]
  env = {
    TAG = "0.0.1"
  }
  runs = "git tag $TAG"
}

action "Swift Publish" {
  uses = "actions/bin/filter@master"
  needs = ["Swift Package Tag"]
  env = {
    NEXT_VERSION = "0.0.1"
  }
  runs = "git push origin $NEXT_VERSION"
}
