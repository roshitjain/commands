#!/bin/bash
PORT=$1
RSYNC_PORT=$2
DEVICE_COUNT=$3

for (( i=2; i<=$DEVICE_COUNT; i++ ))
do
    sed s/DNP_PORT_VALUE/$PORT/ < config_template.xml > tmp/config_dev"$i".xml
    mkdir -p tmp/dev"$i"/lla
    mkdir -p tmp/dev"$i"/otap
    mkdir -p tmp/logIFile"$i"
    sed s/DEVICE_ID/"$i"/ < rsyncd_template.conf > tmp/rsyncd_"$i".conf
    sed -i '' s/RSYNC_PORT_VALUE/$RSYNC_PORT/ tmp/config_dev"$i".xml
    sed -i '' s/RSYNC_CONF_FILE/rsyncd_"$i".conf/ tmp/config_dev"$i".xml
    sed -i '' s/DEVICE_ID/$i/ tmp/config_dev"$i".xml
    ((PORT++))
    ((RSYNC_PORT=RSYNC_PORT+2))

done
