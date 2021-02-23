#!/usr/bin/env bash

cd "$(dirname "$0")" && \
oc process -f deploymentconfig-casual-only.yaml -o=yaml | oc create -f - && \
oc create -f service-casual.yaml
