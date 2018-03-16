FROM ubuntu:16.04
MAINTAINER jermnelson@gmail.com
ENV REPO /opt/repository/
ENV TRPSTR /opt/triplestore/
ENV HOME /home/cataloger

RUN apt-get update && \
    apt-get install -y supervisor openjdk-8-jre-headless

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY libs/fedora.jar $REPO
COPY libs/blazegraph.jar $TRPSTR
COPY config/RWStore.properties $TRPSTR
COPY libs/elasticsearch.tar.gz /opt/elasticsearch.tar.gz
RUN cd /opt/ && \
    tar -xvf elasticsearch.tar.gz && \
    rm elasticsearch.tar.gz && \
    mv elasticsearch* elasticsearch/
RUN useradd -c 'Cataloger Admin' -m -d /home/cataloger -s /bin/bash cataloger && \
    chown -R cataloger /opt/elasticsearch 
VOLUME $REPO/fcrepo4-data
VOLUME $TRPSTR/data 
#COPY fedora.jar $HOME
EXPOSE 8080
EXPOSE 9999
EXPOSE 9200
CMD ["/usr/bin/supervisord","-n"]
