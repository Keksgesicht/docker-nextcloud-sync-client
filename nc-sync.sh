#!/bin/bash

[ -n ${UNSYNC} ] && NC_UNSYNC="--unsyncedfolders ${NC_DIR_CONF}/unsync"
nextcloudcmd -u ${NV_USER} -p ${NC_PASS} $NC_UNSYNC $NC_PARAMS $NC_DIR_SYNC $NC_URL
while [ -n $NC_INTERVAL ]; do
	nextcloudcmd -u ${NV_USER} -p ${NC_PASS} $NC_UNSYNC $NC_PARAMS $NC_DIR_SYNC $NC_URL
	sleep $NC_INTERVAL
done
