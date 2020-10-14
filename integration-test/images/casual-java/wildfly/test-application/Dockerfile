FROM wildfly-base:latest

COPY files/setup.cli /tmp

COPY files/casual-java-testapp.war ${WILDFLY_HOME}/standalone/deployments

RUN ${WILDFLY_HOME}/bin/jboss-cli.sh --file=/tmp/setup.cli

RUN rm -rf /opt/jboss/wildfly/standalone/configuration/standalone_xml_history/current
