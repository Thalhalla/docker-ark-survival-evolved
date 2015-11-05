#!/bin/bash

cd /home/steam
./ShooterGameServer start
echo "Started ARK: Survival Evolved Dedicated Server"
sleep 10
echo "...retreiving details..."
sleep 3
./ShooterGameServer details
sleep 300
# infinite loop to keep it open for Docker
while true; do ./ShooterGameServer monitor; sleep 300; done
