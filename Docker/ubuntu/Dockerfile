FROM ubuntu:24.04

ARG NAME

ENV USUARIO="fredi"
ENV PASSWORD="abc"

RUN apt-get update && apt-get install -yq --no-install-recommends && rm -rf /var/lib/apt/list/* \
    curl \
    nano \
    net-tools \
    iputils-ping
RUN mkdir /root/logs
RUN touch /root/logs/archivo.log

COPY start.sh /root
RUN chmod +x /root/start.sh

ENTRYPOINT [ "/root/start.sh" ]