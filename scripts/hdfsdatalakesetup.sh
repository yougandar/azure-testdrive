#!/bin/sh
adminpassword=$1
MangerIP="10.3.0.5"
curl -u admin:admin 'http://'${MangerIP}':7180/api/v1/clusters/Director_Azure_Deployment/services' > /tmp/ClouderaServices
cat /tmp/ClouderaServices  | grep 'serviceUrl' | awk -F'/' '{print $6}' | tr -d '",' > /tmp/CServices
HDFS=`grep HDFS /tmp/CServices`
echo $HDFS
Name1="dfs.adls.oauth2.client.id"
Value1="4a395406-8019-4fa8-a653-bf57df04477b"
Name2="dfs.adls.oauth2.refresh.url"
Value2="https://login.windows.net/dcf9e4d3-f44a-4c28-be12-8245c0d35668/oauth2/token"
Name3="dfs.adls.oauth2.credential"
Value3="Aonecyvx35qdAet4oI+NXNvatUQdY9TRi88C7DRkQbM="
Name4="dfs.adls.oauth2.access.token.provider.type"
Value4="ClientCredential"
Name5="fs.adl.impl"
Value5="org.apache.hadoop.fs.adl.AdlFileSystem"
Name6="fs.AbstractFileSystem.adl.impl"
Value6="org.apache.hadoop.fs.adl.Adl"
Name7="dfs.adl.test.contract.enable"
Value7="true"
ClusterName="Director_Azure_Deployment"
curl -X PUT -H "content-Type:application/json" -u admin:admin -d '{ "items": [ { "name" : "core_site_safety_valve", "value" : "<property><name>'$Name1'</name><value>'$Value1'</value></property><property><name>'$Name2'</name><value>'$Value2'</value></property><property><name>'$Name3'</name><value>'$Value3'</value></property><property><name>'$Name4'</name><value>'$Value4'</value></property><property><name>'$Name5'</name><value>'$Value5'</value></property><property><name>'$Name6'</name><value>'$Value6'</value></property><property><name>'$Name7'</name><value>'$Value7'</value></property>" }]}' 'http://10.3.0.5:7180/api/v1/clusters/'${ClusterName}'/services/'${HDFS}'/config'
curl -X POST -u admin:admin 'http://'${MangerIP}':7180/api/v1/clusters/'${ClusterName}'/services/'${HDFS}'/commands/restart'
sleep 60
 curl -X POST -u admin:admin 'http://'${MangerIP}':7180/api/v1/clusters/'${ClusterName}'/commands/restart'
