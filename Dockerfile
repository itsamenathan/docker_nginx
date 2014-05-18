FROM ubuntu:latest
MAINTAINER Nathan W "nathan@frcv.net"

VOLUME /nginx
ADD supervisord.conf /tmp/supervisord.conf

RUN apt-get --quiet --yes update && \
    apt-get --quiet --yes install supervisor nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists && \
    cp /tmp/supervisord.conf /etc/supervisor/supervisord.conf
    
EXPOSE 80 443
CMD ["/usr/bin/supervisord"]
