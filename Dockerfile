FROM ubuntu:focal

ENV NC_USER=username
ENV NC_PASS=password
ENV NC_URL="https://example.com/"
ENV NC_INTERVAL=5m
ENV NC_DIR="/nextcloud"
ENV NC_DIR_BIN="${NC_DIR}/bin"
ENV NC_DIR_SYNC="${NC_DIR}/mnt"
ENV NC_DIR_CONF="${NC_DIR}/cfg"
ENV NC_PARAMS=""

ENV UID=99
ENV GID=100

RUN apt update \ 
 && apt install -y --no-install-recommends --no-install-suggests \
		software-properties-common \
 && add-apt-repository -y ppa:nextcloud-devs/client \
 && apt update \
 && apt install -y --no-install-recommends --no-install-suggests \
		nextcloud-desktop-cmd

RUN mkdir -p $NC_DIR_CONF \
 && mkdir $NC_DIR_SYNC

ADD nc_sync.sh ${NC_DIR_BIN}/nc_sync.sh
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
