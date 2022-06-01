FROM ubuntu:18.04
LABEL apt-mirror for Yandex mirror Ubuntu 20.04 (only main repository is available)

ENV DEBIAN_FRONTEND noninteractive
ENV RESYNC_PERIOD 1h

RUN apt-get update \
  && apt-get install --no-install-recommends -y wget apt-mirror apache2 \
  && apt-get autoclean \
  && rm -rf /var/lib/apt/lists/*

COPY mirror.list /etc/apt/mirror.list
COPY cnf.sh /

EXPOSE 80
COPY setup.sh /setup.sh

VOLUME ["/var/www/html/ubuntu"]
CMD ["/bin/bash", "setup.sh"]
