FROM centos:latest
MAINTAINER flurig <flurig@localhost>

RUN yum -y install wget cmake make python rsync libuuid-devel sqlite-devel libpugixml-devel zlib-devel unzip rpm-build centos-release-scl 
RUN yum -y install devtoolset-4-gcc* && scl enable devtoolset-4 bash
RUN wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm
RUN rpm -Uvh epel-release*rpm
RUN yum -y install pugixml-devel yaml-cpp03-devel
RUN ln -s /usr/include/yaml-cpp03 /usr/include/yaml-cpp
RUN ln -s /usr/lib64/libyaml-cpp03.so /usr/lib64/libyaml-cpp.so

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
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:$CASUAL_HOME/lib:$CASUAL_BUILD_HOME/configuration/bin:$CASUAL_BUILD_HOME/common/bin:$CASUAL_BUILD_HOME/serviceframework/bin:$CASUAL_BUILD_HOME/xatmi/bin:/usr/local/lib64:$YAML_LIBRARY_PATH
ENV CASUAL_DOMAIN_HOME /test/casual
ENV CASUAL_LOG '.*'

RUN mkdir -p /git/casual ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
RUN echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros

VOLUME /git/casual
RUN echo 'export PATH=$PATH:/git/casual/bin' >> ~/.bashrc
RUN echo 'source scl_source enable devtoolset-4' >> ~/.bashrc

CMD ["/git/casual/builder.sh"]
