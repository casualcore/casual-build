FROM centos:7
MAINTAINER flurig <flurig@localhost>

LABEL name="centos-base" \
      version="7" \
      description="centos 7 base image with casual dependencies"

RUN yum update-minimal -y
RUN yum install -y epel-release centos-release-scl scl-utils 
RUN yum install -y libuuid-devel pugixml-devel sqlite-devel python libcurl-devel
RUN yum install -y devtoolset-7-gcc-c++ devtoolset-7-make devtoolset-7-binutils git
RUN yum install -y cmake gcc-c++ zlib-devel strace gettext
RUN yum clean all -y
