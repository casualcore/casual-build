FROM ubuntu:latest
MAINTAINER flurig <flurig@localhost>

RUN apt-get update && apt-get -y upgrade && apt-get -y install uuid-dev libyaml-cpp0.3-dev libjson-c-dev libpugixml-dev libsqlite3-dev wget cmake g++-4.8 python rsync && ln -s /usr/bin/g++-4.8 /usr/bin/g++

RUN wget --no-check-certificate https://github.com/jbeder/yaml-cpp/archive/release-0.3.0.tar.gz && tar xf release-0.3.0.tar.gz && cd yaml-cpp-release-0.3.0 && mkdir build && cd build && cmake -DBUILD_SHARED_LIBS=ON .. && make && make install && rm -rf /release-0.3.0.tar.gz /yaml-cpp-release-0.3.0

COPY files/casual.tar /usr/casual.tar
COPY files/start.sh /start.sh

RUN cd /usr && tar xf casual.tar

ENV CASUAL_HOME /usr/local/casual
ENV PATH $CASUAL_HOME/bin:$PATH
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:$CASUAL_HOME/lib
ENV CASUAL_DOMAIN_HOME /test/casual
ENV CASUAL_LOG ".*"

RUN mkdir -p $CASUAL_DOMAIN_HOME
RUN cp -r /usr/local/casual/example/domain/single/minimal/* $CASUAL_DOMAIN_HOME/.
RUN cp $CASUAL_HOME/configuration/example/resources.yaml $CASUAL_HOME/configuration/.
RUN ln -s /dev/stdout $CASUAL_DOMAIN_HOME/casual.log
WORKDIR $CASUAL_DOMAIN_HOME

ENTRYPOINT ["/start.sh"]
