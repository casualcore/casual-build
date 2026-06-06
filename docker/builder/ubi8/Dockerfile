FROM redhat/ubi8
MAINTAINER flurig <flurig@localhost>

RUN yum --exclude=iputils -y update && yum -y install wget cmake make python3 rsync libuuid-devel zlib-devel unzip rpm-build libcurl-devel
RUN yum -y install gcc-toolset-14-gcc* && scl enable gcc-toolset-14 bash
RUN pip3 install conan
ADD sqlite-autoconf-3530100.tar.gz /tmp/.
RUN cd /tmp/sqlite-autoconf-3530100 && source scl_source enable gcc-toolset-14 && ./configure && make && make install
RUN mkdir -p /opt/casual
RUN useradd -m casual
RUN mkdir -p /home/casual/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS} /home/casual/repo/casual
RUN chown -R casual:casual /home/casual /opt/casual

RUN echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros

RUN echo 'export PATH=$PATH:/git/casual/bin' >> ~/.bashrc
RUN echo 'source scl_source enable gcc-toolset-14' >> ~/.bashrc


