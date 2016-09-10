FROM ubuntu:latest
MAINTAINER flurig <flurig@localhost>

RUN apt-get update && apt-get -y upgrade && apt-get -y --purge remove node nodejs-legacy nodejs && apt-get -y install nodejs-legacy npm wget git && npm install -g n && n stable && /usr/local/bin/npm install -g bower && /usr/local/bin/npm install -g polymer-cli

RUN mkdir -p /git/casual
VOLUME /git/casual
RUN echo 'export PATH=$PATH:/git/casual/bin' >> /.bashrc

ENTRYPOINT ["/git/casual/builder.sh"]
