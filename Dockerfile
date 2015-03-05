FROM ubuntu

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install curl -y
RUN curl -O https://download-cdn.getsyncapp.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz
RUN tar -zxvf BitTorrent-Sync_x64.tar.gz
RUN mkdir /data
RUN chmod -R 777 /data

COPY sync-config.json /config.json

VOLUME /data

RUN /bin/bash
