#!/bin/bash

cd /home/steam
./arksserver start
echo "started server"
sleep 10
echo "retreiving details"
sleep 3
./arkserver details
sleep 300
# infinite loop to keep it open for Docker
while true; do ./arkserver monitor; sleep 300; done
