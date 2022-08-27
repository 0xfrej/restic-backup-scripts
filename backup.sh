#!/bin/bash
set -e

source ./common.sh

DEFAULT_EXCLUDES=/dev,/media,/mnt,/proc,/run,/sys,/tmp,/var/tmp

if [ -z "$EXCLUDE" ]
then
	EXCLUDE=$DEFAULT_EXCLUDES
else
	EXCLUDE=$EXCLUDE,$DEFAULT_EXCLUDES
fi

restic backup \
	--one-file-system \
	--exclude-caches \
	--exclude={$EXCLUDE} \
	$EXTRA_ARGS / > "/tmp/backup_$CURRENT_DATE"

restic snapshots $EXTRA_ARGS \
	| tail -n 4 \
	| head -n 2 \
	| cut -f 1 -d ' ' \
	| xargs restic diff $EXTRA_ARGS >> "/tmp/backup_$CURRENT_DATE"

mail -s "Backup Report Workstation $CURRENT_DATE" $REPORT_MAIL < "/tmp/backup_$CURRENT_DATE"

# add webhook for storing the file and sending notification with link to it?
#curl -s https://<redacted>

rm "/tmp/backup_$CURRENT_DATE"
