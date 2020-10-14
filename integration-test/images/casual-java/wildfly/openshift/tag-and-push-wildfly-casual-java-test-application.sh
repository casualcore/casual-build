#!/usr/bin/env bash

cd "$(dirname "$0")" && \
docker tag wildfly-casual-java-test-application $(minishift openshift registry)/myproject/wildfly-casual-java-test-application && docker push $(minishift openshift registry)/myproject/wildfly-casual-java-test-application
