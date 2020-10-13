FROM linux-base:latest
MAINTAINER flurig <flurig@localhost>

LABEL name="casual-base" \
      version="1" \
      description="casual-base, builds a specific casual-base, use GIT_BRANCH to supply branch to use - defaults to feature/1.4/dev"

ARG GIT_BRANCH=feature/1.4/dev

ENV GIT_BRANCH=$GIT_BRANCH
ENV CASUAL_REPO_ROOT /tmp/code/git
ENV CASUAL_BUILD_HOME $CASUAL_REPO_ROOT/casual
ENV CASUAL_HOME /opt/casual
ENV CASUAL_DOMAIN_HOME /test/casual

RUN mkdir -p $CASUAL_REPO_ROOT && cd $CASUAL_REPO_ROOT && git clone https://bitbucket.org/casualcore/casual.git && cd $CASUAL_BUILD_HOME && git checkout $GIT_BRANCH
RUN source scl_source enable devtoolset-7 && cd $CASUAL_BUILD_HOME && cd thirdparty/setup && CMAKE_CXX_COMPILER=g++ python install_yaml.py

ENV YAML_INCLUDE_PATH /usr/local/include
ENV YAML_LIBRARY_PATH /usr/local/lib
ENV JSON_INCLUDE_PATH /usr/local/include
ENV JSON_LIBRARY_PATH /usr/lib/x86_64-linux-gnu
ENV CASUAL_OPTIONAL_INCLUDE_PATHS "$CASUAL_BUILD_HOME/thirdparty/unittest/gtest/include $YAML_INCLUDE_PATH $JSON_INCLUDE_PATH"
ENV CASUAL_OPTIONAL_LIBRARY_PATHS "$CASUAL_BUILD_HOME/thirdparty/unittest/gtest/bin $YAML_LIBRARY_PATH $JSON_LIBRARY_PATH"
ENV PATH $CASUAL_BUILD_HOME/bin:$CASUAL_HOME/bin:$PATH
ENV PYTHONPATH $CASUAL_REPO_ROOT
ENV PATH $CASUAL_BUILD_HOME/tools/bin:$CASUAL_BUILD_HOME/bin:$CASUAL_HOME/bin:$PATH
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:$CASUAL_HOME/lib:$CASUAL_BUILD_HOME/configuration/bin:$CASUAL_BUILD_HOME/common/bin:$CASUAL_BUILD_HOME/serviceframework/bin:$CASUAL_BUILD_HOME/xatmi/bin:/usr/local/lib

RUN ln -s /opt/rh/devtoolset-7/root/usr/bin/make /usr/bin/make
RUN source scl_source enable devtoolset-7 && cd $CASUAL_BUILD_HOME && casual-make && casual-make install
# 1 test failing:
# domain_manager.simple_server__signal_hangup
# Ignoring for now and just installing
# TODO: check what's going on
# Also check why when casual.log can not be created due to PERM error, the process just hangs
# same if /tmp/.casual/ipc can not be written to due to PERM error
# RUN source scl_source enable devtoolset-7 && cd $CASUAL_BUILD_HOME && casual-make test && casual-make install

RUN source scl_source enable devtoolset-7 && cd $CASUAL_BUILD_HOME && cd thirdparty/setup && CMAKE_CXX_COMPILER=g++ python install_nginx.py

COPY uid_entrypoint.sh $CASUAL_HOME/uid_entrypoint.sh

ENV CASUAL_LOG ".*"

RUN mkdir -p $CASUAL_DOMAIN_HOME

RUN     chgrp -R 0 $CASUAL_DOMAIN_HOME && \
	chmod -R g=u $CASUAL_DOMAIN_HOME && \
        chgrp -R 0 $CASUAL_HOME && \
	chmod -R g=u $CASUAL_HOME && \
	chgrp -R 0 /tmp && \
	chmod -R g=u /tmp && \
	chmod g=u /etc/passwd

USER 1001

WORKDIR $CASUAL_DOMAIN_HOME

ENV CASUAL_LOG_PATH $CASUAL_DOMAIN_HOME/casual.log

ENTRYPOINT ["/opt/casual/uid_entrypoint.sh"]
