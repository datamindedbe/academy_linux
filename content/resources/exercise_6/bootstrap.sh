#!/bin/bash

ROOT="$(dirname "$0")/../.."
cd "$ROOT/exercise_6"

RESOURCES_EX2="../resources/exercise_2"
RESOURCES_EX6="../resources/exercise_6"

git init

cp $RESOURCES_EX2/commit1/* .
git add .
git commit -am "Initial commit. Implemented first version of the client and config file."
rm *

cp $RESOURCES_EX2/commit2/* .
git add .
git commit -am "Modified provider API and added a VERSION file."
rm *

cp $RESOURCES_EX2/commit3/* .
git add .
git commit -am "Tried a third API (Google Stock) and got rid of the VERSION file."

cp $RESOURCES_EX6/README.md .
git add .
git commit -am "Added the README for students"
