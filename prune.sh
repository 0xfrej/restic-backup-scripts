#!/bin/bash

set -e

source ./restic.conf

ARGS=

if [ -n "$KEEP_DAILY" ]
then
	ARGS="$ARGS --keep-daily $KEEP_DAILY"
fi

if [ -n "$KEEP_WEEKLY" ]
then
  ARGS="$ARGS --keep-weekly $KEEP_WEEKLY"
fi

if [ -n "$KEEP_MONTHLY" ]
then
  ARGS="$ARGS --keep-monthly $KEEP_MONTHLY"
fi

if [ -n "$KEEP_YEARLY" ]
then
	ARGS="$ARGS --keep-yearly $KEEP_YEARLY"
fi

restic $EXTRA_ARGS check

restic $EXTRA_ARGS forget $ARGS --prune
#restic $EXTRA_ARGS prune
