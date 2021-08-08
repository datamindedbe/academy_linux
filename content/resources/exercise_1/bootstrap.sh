#!/bin/bash

ROOT="$(dirname "$0")/../.."
cd "$ROOT/exercise_1"

RESOURCES="../resources/exercise_1"

cp $RESOURCES/* .
rm bootstrap.sh