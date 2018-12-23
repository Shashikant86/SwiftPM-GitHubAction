#!/bin/sh -l
set -e
git config --global github.user Shashikant86
git config --global github.token $1
# git config --global url."https://Shashikant86:$token@github.com/Shashikant86/SwiftPM-GitHubAction.git"
git tag 0.0.1
git push origin 0.0.1
