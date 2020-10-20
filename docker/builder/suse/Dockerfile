FROM opensuse/leap
MAINTAINER flurig <flurig@localhost>

RUN zypper --non-interactive --gpg-auto-import-keys ref
RUN zypper --non-interactive install rpmbuild libuuid-devel sqlite3-devel gcc9 gcc9-c++ git python make wget cmake tar rsync zlib-devel unzip libcurl-devel

RUN ls -lrt /usr/bin
RUN ln -sf /usr/bin/gcc-9 /usr/bin/gcc
RUN ln -sf /usr/bin/g++-9 /usr/bin/g++

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

ENV CC=gcc

RUN mkdir -p /git/casual ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
RUN echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros

RUN mkdir -p /git/casual
VOLUME /git/casual

ENTRYPOINT ["/git/casual/builder.sh"]
