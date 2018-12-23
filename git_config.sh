#!/bin/sh -l
set -e
git config --global url."https://Shashikant86:$GITHUB_TOKEN@github.com/"
git tag 0.0.1
git push origin 0.0.1"
