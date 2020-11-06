#!/usr/bin/env bash

# Note: minishift is expected to be up and running

eval $(minishift docker-env) && docker login -u developer -p $(oc whoami -t) $(minishift openshift registry) &&
cd "$(dirname "$0")" && 
# Build linux-base, casual-base and casual-domain
../casual/build.sh && \   
# Tag and push to registry
../casual/openshift/tag-and-push-casual-domain.sh && \
# Build wildfly and test application
../casual-java/wildfly/build.sh && \
# Tag and push to registry
../casual-java/wildfly/openshift/tag-and-push-wildfly-casual-java-test-application.sh && \
# Create application
../casual-java/wildfly/openshift/create-application.sh && \
echo All done
