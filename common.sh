#!/bin/bash
set -e

source ./restic.conf

EXTRA_ARGS=
CURRENT_DATE=$(date +%m_%d_%y_%H_%M_%S)

if [ -n "$CA" ]
then
	EXTRA_ARGS="$EXTRA_ARGS --cacert $CA"
fi