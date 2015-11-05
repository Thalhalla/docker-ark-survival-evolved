#!/bin/bash

cd /home/steam
./ShooterGame start
echo "Started ARK: Survival Evolved Dedicated Server"
sleep 10
echo "...retreiving details..."
sleep 3
./ShooterGame details
sleep 300
# infinite loop to keep it open for Docker
while true; do ./ShooterGame monitor; sleep 300; done
