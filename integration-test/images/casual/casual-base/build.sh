#!/usr/bin/env bash

THE_BRANCH=${1:-release/1.3}

echo Building using casual branch $THE_BRANCH

docker build . --build-arg GIT_BRANCH=$THE_BRANCH -t casual-base
