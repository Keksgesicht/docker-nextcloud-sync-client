#!/bin/bash

if [ -n "$UID" ] && [ -n "$GID" ] && [ "$UID" != "0" ] && [ "$GID" != "0" ]; then
	useradd --uid $UID --gid $GID -m nextcloud
	su nextcloud -c ${NC_DIR_BIN}/nc_sync.sh
	exit 0
fi
${NC_DIR_BIN}/nc_sync.sh
