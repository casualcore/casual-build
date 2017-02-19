FROM ubuntu:latest
MAINTAINER flurig <flurig@localhost>

RUN apt-get update && apt-get -y upgrade && apt-get -y install uuid-dev libyaml-cpp0.3-dev libjson-c-dev libpugixml-dev libsqlite3-dev wget cmake g++-4.8 python rsync && ln -s /usr/bin/g++-4.8 /usr/bin/g++

RUN wget --no-check-certificate https://github.com/jbeder/yaml-cpp/archive/release-0.3.0.tar.gz && tar xf release-0.3.0.tar.gz && cd yaml-cpp-release-0.3.0 && mkdir build && cd build && cmake -DBUILD_SHARED_LIBS=ON .. && make && make install && rm -rf /release-0.3.0.tar.gz /yaml-cpp-release-0.3.0

ENV CASUAL_REPO_ROOT /git
ENV CASUAL_TOOLS_HOME $CASUAL_REPO_ROOT/casual
ENV PYTHONPATH $CASUAL_REPO_ROOT
ENV CASUAL_BUILD_HOME $CASUAL_REPO_ROOT/casual/middleware
ENV YAML_INCLUDE_PATH /usr/local/include
ENV YAML_LIBRARY_PATH /usr/local/lib
ENV JSON_INCLUDE_PATH /usr/local/include
ENV JSON_LIBRARY_PATH /usr/lib/x86_64-linux-gnu
ENV CASUAL_OPTIONAL_INCLUDE_PATHS "$CASUAL_TOOLS_HOME/thirdparty/unittest/gtest/include $YAML_INCLUDE_PATH $JSON_INCLUDE_PATH"
ENV CASUAL_OPTIONAL_LIBRARY_PATHS "$CASUAL_TOOLS_HOME/thirdparty/unittest/gtest/bin $YAML_LIBRARY_PATH $JSON_LIBRARY_PATH"
ENV CASUAL_HOME /usr/local/casual
ENV PATH $CASUAL_BUILD_HOME/tools/bin:$CASUAL_TOOLS_HOME/bin:$CASUAL_HOME/bin:$PATH
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:$CASUAL_HOME/lib:$CASUAL_BUILD_HOME/configuration/bin:$CASUAL_BUILD_HOME/common/bin:$CASUAL_BUILD_HOME/serviceframework/bin:$CASUAL_BUILD_HOME/xatmi/bin
ENV CASUAL_DOMAIN_HOME /test/casual
ENV CASUAL_LOG '.*'

RUN mkdir -p /git/casual
VOLUME /git/casual
RUN echo 'export PATH=$PATH:/git/casual/bin' >> /.bashrc

ENTRYPOINT ["/git/casual/builder.sh"]
