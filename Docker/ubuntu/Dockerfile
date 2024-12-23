FROM ubuntu:24.04

ARG NAME

ENV USUARIO="fredi"

RUN apt-get update && apt-get install -yq --no-install-recommends && rm -rf /var/lib/apt/list/* \
    curl \
    nano \
    net-tools \
    iputils-ping
RUN mkdir /root/datos
COPY start.sh /root
RUN chmod +x /root/start.sh

ENTRYPOINT [ "/root/start.sh" ]