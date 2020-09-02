#/bin/bash

useradd --uid $UID --gid $GID -m nextcloud
su nextcloud -c ${NC_DIR_BIN}/nc_sync.sh
