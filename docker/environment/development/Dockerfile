FROM ubuntu:latest

MAINTAINER Mikael Göransson <bitbucket@mgor.se>

RUN useradd -ms /bin/bash -d /home/casual casual

# Casual dependencies
RUN apt-get update && \
    apt-get install -y sudo \
    curl \
    libcurl4-openssl-dev \
    git \
    cmake \
    libyaml-cpp0.3-dev \
    libpugixml-dev \
    uuid-dev \
    libjson-c-dev \
    libsqlite3-dev \
    python \
    build-essential \
    libxss1 \
    vim

RUN cd /tmp && \
    curl -L https://github.com/jbeder/yaml-cpp/archive/release-0.3.0.tar.gz | tar zxf - && \
    cd yaml-cpp-release-0.3.0 && \
    mkdir build && \
    cd build && \
    cmake -DBUILD_SHARED_LIBS=ON .. && \
    make && \
    make install && \
    rm -rf /tmp/yaml-cpp-release-0.3.0

# Microsoft Visual Code dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    unzip \
    libgtk2.0-0 \
    libgconf-2.4 \
    libnss3 \
    libasound2 \
    libxtst6 \
    libnotify4 \
    libxkbfile1 \
    libsecret-1-0 \
    libx11-xcb-dev \
    pylint \
    shellcheck

ENV CASUAL_REPO_ROOT /home/casual/git
ENV CASUAL_TOOLS_HOME $CASUAL_REPO_ROOT/casual
ENV PYTHONPATH $CASUAL_REPO_ROOT
ENV CASUAL_BUILD_HOME $CASUAL_REPO_ROOT/casual
ENV CASUAL_XATMI_TEST_HOME /opt/casual-xatmi-test
ENV YAML_INCLUDE_PATH /usr/local/include
ENV YAML_LIBRARY_PATH /usr/local/lib
ENV JSON_LIBRARY_PATH /usr/lib/x86_64-linux-gnu
ENV CASUAL_OPTIONAL_INCLUDE_PATHS "$CASUAL_TOOLS_HOME/thirdparty/unittest/gtest/include $YAML_INCLUDE_PATH"
ENV CASUAL_OPTIONAL_LIBRARY_PATHS "$CASUAL_TOOLS_HOME/thirdparty/unittest/gtest/bin $YAML_LIBRARY_PATH $JSON_LIBRARY_PATH"
ENV CASUAL_HOME /opt/casual
ENV PATH $CASUAL_BUILD_HOME/tools/bin:$CASUAL_TOOLS_HOME/bin:$CASUAL_HOME/bin:$PATH
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:$CASUAL_HOME/lib:$CASUAL_BUILD_HOME/middleware/configuration/bin:$CASUAL_BUILD_HOME/middleware/common/bin:$CASUAL_BUILD_HOME/middleware/serviceframework/bin:$CASUAL_BUILD_HOME/middleware/xatmi/bin

RUN curl -o /tmp/vscode-amd64.deb -L "https://go.microsoft.com/fwlink/?LinkID=760868" && \
    dpkg -i /tmp/vscode-amd64.deb && rm -f /tmp/vscode-amd64.deb

RUN mkdir -p /home/casual/git && \
    chown -R casual:casual /home/casual && \
    mkdir -p ${CASUAL_HOME} && \
    chown -R casual:casual ${CASUAL_HOME} && \
    mkdir -p ${CASUAL_XATMI_TEST_HOME} && \
    chown -R casual:casual ${CASUAL_XATMI_TEST_HOME}

VOLUME /home/casual/git

VOLUME ${CASUAL_HOME}

VOLUME ${CASUAL_XATMI_TEST_HOME}

USER casual

WORKDIR /home/casual/git

RUN code --install-extension ms-vscode.cpptools && \
    code --install-extension ms-python.python && \
    code --install-extension timonwong.shellcheck && \
    code --install-extension eamodio.gitlens && \
    code --install-extension arcticicestudio.nord-visual-studio-code && \
    code --install-extension jamesmaj.easy-icons && \
    code --install-extension vscodevim.vim

CMD ["bash"]

