#!/bin/bash

ROOT="$(dirname "$0")/../.."
cd "$ROOT/exercise_4"

RESOURCES_EX2="../resources/exercise_2"
RESOURCES_EX4="../resources/exercise_4"

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

cp $RESOURCES_EX4/commit4/* .
git add .
git commit -am "Made the example slightly (:p) more complex."

git checkout -b feature_branch
cp $RESOURCES_EX4/commit5_feature_branch/* .
git add .
git commit -am "Worked on the feature. Modified routing in the client and configs."

git checkout master
cp $RESOURCES_EX4/commit5_main/* .
git add .
git commit -am "Hotfixed some erroneous configs. Deleted others. Fixed a wrongly named routing in client."

git checkout feature_branch

cp $RESOURCES_EX4/README.md .
git add .
git commit -am "Added the README for students"
