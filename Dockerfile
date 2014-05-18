FROM ubuntu:latest
MAINTAINER Nathan W "nathan@frcv.net"

VOLUME /nginx
ADD supervisord.conf /tmp/supervisord.conf

RUN apt-get --quiet --yes update && \
    apt-get --quiet --yes install supervisor nginx \
      php5 php5-pgsql php5-fpm php-apc php5-curl php5-cli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists && \
    sed -i 's/;daemonize.*/daemonize = no/' /etc/php5/fpm/php-fpm.conf && \
    cp /tmp/supervisord.conf /etc/supervisor/supervisord.conf
    
EXPOSE 80 443
CMD ["/usr/bin/supervisord"]
