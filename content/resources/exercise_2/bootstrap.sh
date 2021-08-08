#!/bin/bash

ROOT="$(dirname "$0")/../.."
cd "$ROOT/exercise_2"

RESOURCES="../resources/exercise_2"

git init

cp $RESOURCES/commit1/* .
git add .
git commit -am "Initial commit. Implemented first version of the client and config file."
rm *

cp $RESOURCES/commit2/* .
git add .
git commit -am "Modified provider API and added a VERSION file."
rm *

cp $RESOURCES/commit3/* .
git add .
git commit -am "Tried a third API (Google Stock) and got rid of the VERSION file."

cp $RESOURCES/README.md .
git add .
git commit -am "Added the README for students"
