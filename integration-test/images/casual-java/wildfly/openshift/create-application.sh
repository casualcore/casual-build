#!/usr/bin/env bash

cd "$(dirname "$0")" && \
oc process -f deploymentconfig.yaml -o=yaml | oc create -f - && \
oc create -f service.yaml && \
oc create -f wildfly-route.yaml && \
oc create -f admin-route.yaml
