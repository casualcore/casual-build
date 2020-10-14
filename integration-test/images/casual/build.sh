#!/usr/bin/env bash

cd "$(dirname "$0")" && \
./linux-base/centos/build.sh && ./casual-base/build.sh && ./casual-domain/build.sh
