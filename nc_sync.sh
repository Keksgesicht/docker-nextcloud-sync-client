#!/bin/bash

mkdir -p ~/.local/share/nextcloudcmd

[ -n "${UNSYNC}" ] && NC_UNSYNC="--unsyncedfolders ${NC_DIR_CONF}/unsync"
nextcloudcmd -u ${NC_USER} -p ${NC_PASS} $NC_UNSYNC $NC_PARAMS $NC_DIR_SYNC $NC_URL
while [ -n "${NC_INTERVAL}" ]; do
	nextcloudcmd -u ${NC_USER} -p ${NC_PASS} $NC_UNSYNC $NC_PARAMS $NC_DIR_SYNC $NC_URL
	sleep $NC_INTERVAL
done
