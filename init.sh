#!/bin/bash
set -e

source ./common.sh

echo "Initializing restic repository $RESTIC_REPOSITORY"
restic $EXTRA_ARGS init
printf "Repository initialized!\n\n"

restic $EXTRA_ARGS init cat config