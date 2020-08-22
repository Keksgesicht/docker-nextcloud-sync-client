FROM alphine

ENV USER_NAME=ncsync
ENV USER_UID=99
ENV USER_GID=100

ENV NV_USER=username
ENV NC_PASS=password
ENV NC_URL="https://example.com/"
ENV NC_INTERVAL=5m
ENV NC_DIR="/nextcloud"
ENV NC_DIR_BIN="${NC_DIR}/bin"
ENV NC_DIR_SYNC="${NC_DIR}/mnt"
ENV NC_DIR_CONF="${NC_DIR}/cfg"
ENV NC_PARAMS=""

RUN addgroup -g $USER_GID $USER_NAME && adduser -G $USER_NAME -D -u $USER_UID $USER_NAME
RUN apk update && apk add nextcloud-client && rm -rf /etc/apk/cache

ADD nc_sync.sh ${NC_DIR_BIN}/nc_sync.sh
USER $USER_NAME
ENTRYPOINT ${NC_DIR_BIN}/nc_sync.sh