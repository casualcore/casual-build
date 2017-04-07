FROM ubuntu:latest
MAINTAINER flurig <flurig@localhost>

RUN apt-get update && apt-get -y upgrade && apt-get -y --purge remove node nodejs-legacy nodejs && apt-get -y install nodejs-legacy npm wget git curl && npm install -g n && n stable && /usr/local/bin/npm install -g bower && /usr/local/bin/npm install -g polymer-cli 

RUN mkdir /.config && chmod -R 777 /.config

RUN echo 'export PATH=$PATH:.' > /root/.bashrc

RUN echo '{ "allow_root": true }' > /root/.bowerrc

CMD ["/bin/bash"]
