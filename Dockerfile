FROM ubuntu:latest
MAINTAINER Alexej Bondarenko <alexej.bondarenko@ersocon.net>

RUN apt-get update

RUN apt-get install -y postgresql libgmp3-dev zlib1g-dev 

RUN apt-get install -y htop nano wget ca-certificates

ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /opt/keter/bin
RUN mkdir /opt/keter/etc
RUN mkdir /opt/keter/log
RUN mkdir /opt/keter/data

COPY keter-bin /opt/keter/bin/keter
COPY keter-config.yaml /opt/keter/etc/keter-config.yaml

EXPOSE 80

CMD ["/opt/keter/bin/keter", "/opt/keter/etc/keter-config.yaml"]
