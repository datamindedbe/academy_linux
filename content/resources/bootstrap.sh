#!/bin/bash

ROOT="$(dirname "$0")/.."
cd $ROOT

for EXERCISE in $(ls resources | grep exercise); do
    echo "-------------------------------"
    echo "... Boostraping $EXERCISE ..."
    echo "-------------------------------"
    mkdir $EXERCISE
    ./resources/$EXERCISE/bootstrap.sh
done
