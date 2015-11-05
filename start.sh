#!/bin/bash

cd /home/steam
echo sed
sed -i 's/steamuser="anonymous"/steamuser=REPLACE_USER/' ShooterGameServer
sed -i 's/steampass=""/steampass=REPLACE_PASSWORD/' ShooterGameServer
sed -i "s/steamuser=REPLACE_USER/steamuser='$STEAM_USERNAME'/" ShooterGameServer
sed -i "s/steampass=REPLACE_PASSWORD/steampass='$STEAM_PASSWORD'/" ShooterGameServer
set_steam_guard_code $STEAM_GUARD_CODE
yes y|./ShooterGameServer install
#cp -v ./serverconfig_template.xml ./serverfiles/ark-server.xml
bash /run.sh
