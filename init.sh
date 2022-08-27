#!/bin/bash
set -e

source ./common.sh

EXTRA_ARGS="$EXTRA_ARGS -r $RESTIC_REPOSITORY" # weird behaviour of restic on my rpi needed to explicitly use -r parameter

echo "Initializing restic repository $RESTIC_REPOSITORY"
restic $EXTRA_ARGS init
printf "Repository initialized!\n\n"

restic $EXTRA_ARGS init cat config