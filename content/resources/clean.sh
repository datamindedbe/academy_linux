#!/bin/bash

ROOT="$(dirname "$0")/.."
cd $ROOT

for EXERCISE in $(ls | grep exercise); do
    rm -rf $EXERCISE
done