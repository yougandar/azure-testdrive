#!/bin/bash
adminUsername=$1
adminPassword=$2
cloudera-director bootstrap-remote azure.simple.expanded.conf --lp.remote.username=$1 --lp.remote.password=$2 --lp.remote.hostAndPort=$1:7189