from casual-base:latest

MAINTAINER flurig <flurig@localhost>

LABEL name="casual-domain" \
      version="1" \
      description="casual-domain, configures a specific casual domain, use CONFIG_DIR env var to specify the configuration directory to use, defaults to config/config-casual-with-java"

ARG CONFIG_DIR=config/config-casual-with-java
ENV CONFIG_DIR=$CONFIG_DIR

COPY ./$CONFIG_DIR/ $CASUAL_DOMAIN_HOME/configuration

COPY casual-fields.json $CASUAL_DOMAIN_HOME/configuration

ENV CASUAL_FIELD_TABLE $CASUAL_DOMAIN_HOME/casual-fields.json

EXPOSE 7771
