# Build casual java
# Put your:
# casual-fields.json
# casual-java-testapp.war
# casual-jca-0.0.1.ear
# into files/

# Pull base image
# ---------------
FROM casual-java/domain

USER root
RUN apt-get update && apt-get -y upgrade && apt-get -y install net-tools && apt-get -y install apt-utils && apt-get -y install emacs25-nox

USER oracle
ENV CASUAL_FIELD_TABLE /u01/oracle/casual-fields.json

# Copy files and deploy application in WLST Offline mode
COPY container-scripts/* /u01/oracle/
COPY files/* /u01/oracle/

# Define variables
ENV APP_NAME="state-management-provider-memory-rar-impl" \
    APP_PKG_FILE="com.oracle.state-management.state-management-provider-memory-rar-impl.rar" \
    APP_PKG_LOCATION="/u01/oracle/oracle_common/modules" \
    APP_MODULE_TYPE="rar"\
    APP_DEPLOYMENT_ORDER=100\
    APP_DEPLOYMENT_PLAN=""
RUN wlst /u01/oracle/deploy.py

# Define variables
ENV APP_NAME="casual-jca" \
    APP_PKG_FILE="casual-jca-0.0.1.ear" \
    APP_DEPLOYMENT_ORDER="50" \
    APP_PKG_LOCATION="/u01/oracle"

RUN wlst /u01/oracle/deploy.py

# Define variables
ENV APP_NAME="casual-java-testapp" \
    APP_PKG_FILE="casual-java-testapp.war" \
    APP_DEPLOYMENT_ORDER="100" \
    APP_PKG_LOCATION="/u01/oracle"

RUN wlst /u01/oracle/deploy.py

# Define variables
ENV APP_NAME="casual-jca" \
    APP_PKG_LOCATION="/u01/oracle" \
    WLS_PASSWD="weblogic1" \
    WLS_HOST="t3://127.0.0.1:7001" \
    APP_DEPLOYMENT_PLAN="exampleDeploymentPlan.xml"

RUN wlst /u01/oracle/updateAppDeployment.py
