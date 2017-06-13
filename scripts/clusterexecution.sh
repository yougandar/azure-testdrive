#!/bin/bash
dirUsername=$1
dirPassword=$2
host=$3
cloudera-director bootstrap-remote azure.simple.expanded.conf --lp.remote.username="$1" --lp.remote.password="$2" --lp.remote.hostAndPort="$3":7189
