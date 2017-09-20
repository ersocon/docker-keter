FROM ubuntu:latest
MAINTAINER Alexej Bondarenko <alexej.bondarenko@ersocon.net>

RUN apt-get update

RUN apt-get install -y postgresql libgmp3-dev zlib1g-dev 

RUN apt-get install -y htop nano

RUN mkdir -p /opt/keter/bin
RUN mkdir /opt/keter/etc
RUN mkdir /opt/keter/log

COPY keter-bin /opt/keter/bin/keter
COPY keter-config.yaml /opt/keter/etc/keter-config.yaml

EXPOSE 80

CMD ["/opt/keter/bin/keter", "/opt/keter/etc/keter-config.yaml"]
