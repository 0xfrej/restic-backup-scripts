#!/bin/bash
set -e

set -o allexport
source ./restic.conf
set +o allexport

EXTRA_ARGS=
export CURRENT_DATE=$(date +%m_%d_%y_%H_%M_%S)

if [ -n "$CA" ]
then
	EXTRA_ARGS="$EXTRA_ARGS --cacert $CA"
fi