FROM linux-base:latest
MAINTAINER flurig <flurig@localhost>

LABEL name="casual-base" \
      version="1" \
      description="casual-base, builds a specific casual-base, use GIT_BRANCH to supply branch to use - defaults to feature/1.4/dev"

ARG GIT_TAG=1.3.7

ENV GIT_TAG=$GIT_TAG

ENV CASUAL_REPO_ROOT /tmp/code/git
ENV CASUAL_BUILD_HOME $CASUAL_REPO_ROOT/casual
ENV CASUAL_HOME /opt/casual
ENV CASUAL_DOMAIN_HOME /test/casual

RUN mkdir -p $CASUAL_REPO_ROOT
COPY code $CASUAL_REPO_ROOT
RUN ls $CASUAL_REPO_ROOT
RUN ls $CASUAL_BUILD_HOME

RUN ls /usr/bin/py*
RUN cd $CASUAL_BUILD_HOME && source ./casual.env && casual-make --help

ENV PATH $CASUAL_BUILD_HOME/bin:$CASUAL_HOME/bin:$PATH
ENV PATH $CASUAL_BUILD_HOME/tools/bin:$CASUAL_BUILD_HOME/bin:$CASUAL_HOME/bin:$PATH
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:$CASUAL_HOME/lib:$CASUAL_BUILD_HOME/configuration/bin:$CASUAL_BUILD_HOME/common/bin:$CASUAL_BUILD_HOME/serviceframework/bin:$CASUAL_BUILD_HOME/xatmi/bin:/usr/local/lib

# check that std::filesystem works
RUN dnf -y install gcc-toolset-9-gcc gcc-toolset-9-gcc-c++
ENV PATH=/opt/rh/gcc-toolset-9/root/usr/bin:$PATH
RUN cd $CASUAL_BUILD_HOME && g++ -v -std=c++17 -o test-fs test.cpp && ./test-fs

RUN cd $CASUAL_BUILD_HOME && source ./casual.env && casual-make compile --debug
RUN cd $CASUAL_BUILD_HOME && source ./casual.env && casual-make link --debug && casual-make test && casual-make install
# 1 test failing:
# domain_manager.simple_server__signal_hangup
# Ignoring for now and just installing
# TODO: check what's going on
# Also check why when casual.log can not be created due to PERM error, the process just hangs
# same if /tmp/.casual/ipc can not be written to due to PERM error
# RUN source scl_source enable devtoolset-7 && cd $CASUAL_BUILD_HOME && casual-make test && casual-make install

RUN cd $CASUAL_BUILD_HOME && cd thirdparty/setup && CMAKE_CXX_COMPILER=g++ python3 install_nginx.py

RUN yum install -y gdb-gdbserver && yum install -y gdb && yum install -y glibc-common
RUN yum install -y file && yum install -y binutils
#RUN yum whatprovides objdump

RUN echo "source /opt/rh/gcc-toolset-9/enable" >> /etc/bashrc

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
