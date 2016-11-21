PID=`cat /var/run/elasticsearch.pid`
echo ${PID}
rm /tmp/hsperfdata_${PID}
ln -s /tmp/hsperfdata_elasticsearch/${PID} /tmp/hsperfdata_${PID}