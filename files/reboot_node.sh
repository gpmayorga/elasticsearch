#!/bin/sh
s=localhost
curl -XPUT  "http://$s:9200/_cluster/settings" -d '{ "transient" : { "cluster.routing.allocation.enable" : "none" } }'
curl -XPUT  "http://$s:9200/_cluster/settings" -d '{ "transient" : { "indices.recovery.max_bytes_per_sec" : "100mb" } }'
curl -XPOST  "http://$s:9200/_cluster/nodes/_local/_shutdown"
while [[ `curl --write-out %{http_code} --silent --output /dev/null "http://${s}:9200"` != 200 ]]
do
	sleep 1s
done
curl -XPUT  "http://$s:9200/_cluster/settings" -d '{ "persistent" : { "cluster.routing.allocation.enable" : "all" } }'
while [[ `curl --silent -XGET "http://${s}:9200/_cluster/health"` != *"green"* ]]
do
	sleep 1s
done