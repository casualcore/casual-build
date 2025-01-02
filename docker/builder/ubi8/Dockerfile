FROM redhat/ubi8
MAINTAINER flurig <flurig@localhost>

RUN yum --exclude=iputils -y update && yum -y install wget cmake make python39 rsync libuuid-devel zlib-devel unzip rpm-build libcurl-devel git
RUN yum -y install gcc-toolset-13-gcc* && scl enable gcc-toolset-13 bash
ADD sqlite-autoconf-3460100.tar.gz /tmp/.
RUN cd /tmp/sqlite-autoconf-3460100 && source scl_source enable gcc-toolset-13 && ./configure && make && make install
ENV CASUAL_REPO_ROOT /git
ENV CASUAL_TOOLS_HOME $CASUAL_REPO_ROOT/casual
ENV PYTHONPATH $CASUAL_REPO_ROOT
ENV CASUAL_BUILD_HOME $CASUAL_REPO_ROOT/casual
ENV YAML_INCLUDE_PATH /usr/include
ENV YAML_LIBRARY_PATH /usr/lib64
ENV JSON_INCLUDE_PATH /usr/local/include
ENV JSON_LIBRARY_PATH /usr/lib/x86_64-linux-gnu
ENV CASUAL_OPTIONAL_INCLUDE_PATHS "$CASUAL_TOOLS_HOME/thirdparty/unittest/gtest/include $YAML_INCLUDE_PATH $JSON_INCLUDE_PATH"
ENV CASUAL_OPTIONAL_LIBRARY_PATHS "$CASUAL_TOOLS_HOME/thirdparty/unittest/gtest/bin $YAML_LIBRARY_PATH $JSON_LIBRARY_PATH /usr/local/lib64"
ENV CASUAL_HOME /opt/casual
ENV PATH $CASUAL_BUILD_HOME/tools/bin:$CASUAL_TOOLS_HOME/bin:$CASUAL_HOME/bin:$PATH
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:$CASUAL_HOME/lib:$CASUAL_BUILD_HOME/configuration/bin:$CASUAL_BUILD_HOME/common/bin:$CASUAL_BUILD_HOME/serviceframework/bin:$CASUAL_BUILD_HOME/xatmi/bin:/usr/local/lib:/usr/local/lib64:$YAML_LIBRARY_PATH
ENV CASUAL_DOMAIN_HOME /test/casual
ENV CASUAL_LOG '.*'
ENV CASUAL_LOG_PATH /git/casual/casual.log

RUN mkdir -p /git/casual ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

RUN echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros

VOLUME /git/casual
RUN echo 'export PATH=$PATH:/git/casual/bin' >> ~/.bashrc
RUN echo 'source scl_source enable gcc-toolset-13' >> ~/.bashrc

CMD ["/git/casual/builder.sh"]

