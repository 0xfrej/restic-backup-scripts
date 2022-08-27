#!/bin/bash
set -e

source ./restic.conf

export CURRENT_DATE=$(date +%m_%d_%y_%H_%M_%S)

DEFAULT_EXCLUDES=/dev,/media,/mnt,/proc,/run,/sys,/tmp,/var/tmp

if [ -z "$EXCLUDE" ]
then
      EXCLUDE=$DEFAULT_EXCLUDES
else
      $EXCLUDE=$EXCLUDE,$DEFAULT_EXCLUDES
fi

restic backup \
	--one-file-system \
	--exclude-caches \
	--exclude={$EXCLUDE} \
	/ > "/tmp/backup_$CURRENT_DATE" 2>&1

restic snapshots \
	| tail -n 4 \
	| head -n 2 \
	| cut -f 1 -d ' ' \
	| xargs restic diff >> "/tmp/backup_$CURRENT_DATE" 2>&1

mail -s "Backup Report Workstation $CURRENT_DATE" $REPORT_MAIL < "/tmp/backup_$CURRENT_DATE"

# add webhook for storing the file and sending notification with link to it?
#curl -s https://<redacted>

rm "/tmp/backup_$CURRENT_DATE"
