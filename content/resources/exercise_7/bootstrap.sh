#!/bin/bash

ROOT="$(dirname "$0")/../.."
cd "$ROOT/exercise_7"

RESOURCES_EX7="../resources/exercise_7"

git init

cp -r $RESOURCES_EX7/commit1/* .
git add .
git commit -am "Initial commit. v1 of the server."

cp $RESOURCES_EX7/README.md .
git add .
git commit -am "Added the README for students"
