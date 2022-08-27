#!/bin/bash
set -e

source ./restic.conf

if [ -z $AUTO_UPDATE ]
then
  AUTO_UPDATE=0
fi

if [ "$AUTO_UPDATE" -eq 1 ]
then
  git pull
  ./install_cron.sh
fi