#!/bin/bash

# Este script intenta automatizar el pusheo de cosas a github

rama=$(git branch --show-current)

git add .
git commit -m "$1"
git push origin ${2:-rama}
