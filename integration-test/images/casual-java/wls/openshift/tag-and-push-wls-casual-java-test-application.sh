#!/usr/bin/env bash

cd "$(dirname "$0")" && \
docker tag casual-weblogic-jca $(minishift openshift registry)/myproject/casual-weblogic-jca && docker push $(minishift openshift registry)/myproject/casual-weblogic-jca
