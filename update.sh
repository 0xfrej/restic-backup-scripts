#!/bin/bash
set -e

source ./restic.conf

if [ "$AUTO_UPDATE" -eq 1 ]
then
  git pull
  ./install_cron.sh
fi