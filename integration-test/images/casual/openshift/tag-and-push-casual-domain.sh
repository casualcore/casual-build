#!/usr/bin/env bash

cd "$(dirname "$0")" && \
docker tag casual-domain $(minishift openshift registry)/myproject/casual-domain && docker push $(minishift openshift registry)/myproject/casual-domain
