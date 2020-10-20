FROM centos:centos7
MAINTAINER flurig <flurig@localhost>

RUN yum --exclude=iputils -y update && yum -y install wget cmake make python3 rsync libuuid-devel sqlite-devel zlib-devel unzip rpm-build centos-release-scl libcurl-devel git && \
    yum -y install devtoolset-9-gcc* && scl enable devtoolset-9 bash && \
    yum -y install python3-pip && \
    pip3 install gcovr

ENV CASUAL_REPO_ROOT=/git/casual/casual
ENV CASUAL_THIRDPARTY=/git/casual/casual-thirdparty 
ENV CASUAL_HOME=/opt/casual 
ENV CASUAL_TOOLS_HOME=$CASUAL_REPO_ROOT \
    PYTHONPATH=$CASUAL_REPO_ROOT/.. \
    CASUAL_BUILD_HOME=$CASUAL_REPO_ROOT \
    CASUAL_OPTIONAL_INCLUDE_PATHS="${CASUAL_THIRDPARTY}/googletest/include" \
    CASUAL_OPTIONAL_LIBRARY_PATHS="${CASUAL_THIRDPARTY}/googletest/bin" \
    CASUAL_DOMAIN_HOME=/test/casual \
    CASUAL_LOG='.*' \
    CASUAL_LOG_PATH=/git/casual/casual.log
ENV PATH=$CASUAL_BUILD_HOME/tools/bin:$CASUAL_TOOLS_HOME/bin:$CASUAL_HOME/bin:$PATH 
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CASUAL_HOME/lib:$CASUAL_BUILD_HOME/configuration/bin:$CASUAL_BUILD_HOME/common/bin:$CASUAL_BUILD_HOME/serviceframework/bin:$CASUAL_BUILD_HOME/xatmi/bin:/usr/local/lib 

RUN mkdir -p /git/casual ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

RUN echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros

VOLUME /git/casual
RUN echo 'source scl_source enable devtoolset-9' >> ~/.bashrc

CMD ["/git/casual/builder.sh"]
