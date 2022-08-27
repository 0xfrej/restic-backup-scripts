#!/bin/bash

set -e

source ./restic.conf

restic forget --keep-last $RETENTION --prune
