#!/bin/bash
dirUsername=$1
dirPassword=$2
host=$3
cd /home/azureuser
sudo chmod 777 azure.simple.expanded.conf 
cloudera-director bootstrap-remote azure.simple.expanded.conf --lp.remote.username="$dirUsername" --lp.remote.password="$dirPassword" --lp.remote.hostAndPort="$host":7189
