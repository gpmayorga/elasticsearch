#!/bin/bash

SNAPSHOT=`date +%Y%m%d-%H%M%S`
curl -XPUT "localhost:9200/_snapshot/{{ es.uba.snapshots.repo }}/$SNAPSHOT?wait_for_completion=true"