#!/usr/bin/env bash

THE_BRANCH=${1:-feature/1.4/dev}

echo Building using casual branch $THE_BRANCH

docker build . --build-arg GIT_BRANCH=$THE_BRANCH -t casual-base
